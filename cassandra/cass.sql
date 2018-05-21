DROP KEYSPACE blockchainexplorer;
CREATE KEYSPACE IF NOT EXISTS blockchainexplorer WITH REPLICATION = { 'class' : 'NetworkTopologyStrategy', 'datacenter1' : 3 };
USE blockchainexplorer;

CREATE TYPE IF NOT EXISTS transaction (
    fromaddress text,
    toaddress text,
    amount bigint,
);

CREATE TYPE IF NOT EXISTS contracttype (
    accountcreatecontract int,
    transfercontract int,
    transferassetcontract int,
    voteassetcontract int,
    votewitnesscontract int,
    witnesscreatecontract int,
    assetissuecontract int,
    deploycontract int,
    witnessupdatecontract int,
    participateassetissuecontract int,
    accountupdatecontract int,
    freezebalancecontract int,
    unfreezebalancecontract int,
    withdrawbalancecontract int,
    customcontract int,
);

CREATE TABLE IF NOT EXISTS transactions (
    uuid uuid,
    blocknum bigint,
    transactionnum bigint,
    fromaddress text,
    toaddress text,
    amount bigint,
    PRIMARY KEY (uuid, blocknum, transactionnum)
);

CREATE TYPE IF NOT EXISTS voteslist (
    voteaddress text,
    votecount bigint,
);

CREATE TYPE IF NOT EXISTS frozenlist (
    frozenBalance bigint,
    expireTime bigint,
);

CREATE TABLE IF NOT EXISTS accounts (
    uuid uuid,
    accountname text,
    type int,
    address text,
    balance bigint,
    voteslist map<text, frozen<voteslist>>,
    assetmap map<text, bigint>,
    latestoprationtime bigint,
    frozenlist map<text, frozen<frozenlist>>,
    bandwidth bigint,
    createtime bigint,
    allowance bigint,
    latestwithdrawtime bigint,
    code text,
    PRIMARY KEY (uuid, address)
);

CREATE TABLE IF NOT EXISTS block (
    uuid uuid,
    hash text,
    parentHash text,
    number bigint,
    time bigint,
    contracttype map<text, frozen<contracttype>>,
    witnessAddress text,
    transactionsCount int,
    transactions map<text, frozen<transaction>>,
    size bigint,
    transactionsTotal bigint,
    PRIMARY KEY (uuid, number)
);

CREATE TABLE IF NOT EXISTS witness (
    address text,
    votecount bigint,
    pubkey text,
    url text,
    totalproduced bigint,
    totalmissed bigint,
    latestblocknum bigint,
    latestslotnum bigint,
    isjobs boolean,
    PRIMARY KEY (address)
);

CREATE TABLE IF NOT EXISTS nodes (
    host text,
    port text,
    city text,
    region text,
    latitude double,
    longitude double,
    continentcode text,
    countryname text,
    country text,
    regioncode text,
    currency text,
    org text,
    PRIMARY KEY (host)
);

CREATE TABLE IF NOT EXISTS assetissues (
    ownerAddress text,
    name text,
    totalSupply bigint,
    trxNum bigint,
    num bigint,
    startTime bigint,
    endTime bigint,
    decayRatio bigint,
    voteScore bigint,
    description text,
    url text,
    PRIMARY KEY (ownerAddress)
);

-- INSERT INTO nodes (host, port, city, org, latitude, longitude, continentcode, countryname, country, regioncode, currency, org) VALUES (host, port, currency, org, latitude, longitude, countinentalcode, countryname, country, regioncode, region, city);

-- INSERT INTO accounts (accountname, type, address, balance, voteslist, assetmap, latestoprationtime, frozenlist, bandwidth, createtime, allowance, latestwithdrawtime, code) VALUES ('', 0, '27cR9nG28vFbES1wqmCLGymYxCmawqFHXck', 402789000000, {}, {}, 1525874976000, {'0': {frozenBalance: 0, expireTime: 2}}, 0, 1525867938000, 0, 0, '');

-- INSERT INTO assetissues (ownerAddress, name, totalSupply, trxNum, num, startTime, endTime, decayRatio, voteScore, description, url) VALUES ('oEeI3RNeKFjDe0jFJXI9Zgt6YydY', 'VFJY', 10000, 1000000000, 0, 0, 0, 0, 0, 'VHJvbml4', 'aHR0cHM6Ly90d2l0dGVyLmNvbS9Ba29zY2kx');

-- INSERT INTO witness (address, votecount, pubkey, url, totalmissed, latestblocknum, latestslotnum, isjobs) VALUES ('oJKLwolvslTgX8KfI2M41RMJKt9u', 0, '', 'https://www.cryptobitkings.com/', 0, 0, 0, false);


-- INSERT INTO block (parentHash, number, time, contracttype, witnessAddress, transactionsCount, transactions, size) VALUES ('0000000000000004FC3D510BC1661E4E5905A4C197B07FEC05DC8D4784F0A898', 2, 0, { 'asd': { accountcreate: 0, transfer: 1, transferasset: 2, voteasset: 3,votewitness: 4,witnesscreate: 5, assetissue: 6, deploy: 7, witnessupdate: 8, participateassetissue: 9, accountupdate:10, freezebalance: 11, unfreezebalance:12, withdrawbalance:13, custom:20 } }, '27YkUVSuvCK3K84DbnFnxYUxozpi793PTqZ', 3, {'asd' :{ fromAddress: 'val1',
-- toAddress: 'val0', amount: 100 }, 'asdwqe' :{ fromAddress: 'val2', toAddress: 'val3', amount: 100 }}, 1000);
