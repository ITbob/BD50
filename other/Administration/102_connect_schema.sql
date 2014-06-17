alter system set local_listener="(ADDRESS=(PROTOCOL=TCP)(HOST=XPSQL)(PORT=1521))" scope = both;
exec dbms_xdb.setftpport(2100);
exec dbms_xdb.sethttpport(8080);
alter system register;