drop database if exists consulta;
create database consulta;
use consulta;

drop table if exists usuarios;
create table usuarios(
	bol int (20) primary key,
    usr nvarchar(50) ,
    tipoUsr int(3) ,
    mail nvarchar(50) ,
    crra nvarchar(100),
    psw nvarchar(50) ,
    nom nvarchar(50) ,
    aPat nvarchar(50),
    aMat nvarchar(50),
    r1 int(100),
    r2 int(100),
    r3 int(100),
    r4 int(100),
    r5 int(100),
    fin float(2,2)
);

drop table if exists entradas;
create table entradas(
	idEnt int(10) primary key,
    usr nvarchar(50),
	dia timestamp 
);


insert into usuarios(bol,usr,tipoUsr,mail,crra,psw,nom,aPat,aMat) values(2015090116, "root", 1, "yo@yo.com", "ciencias", "psw", "Sandy", "Cesp", "Guer");

drop procedure if exists calif;
delimiter **
create procedure calif(in xusrp nvarchar(100), in xr1 int(100),  in xr2 int(100), in xr3 int(100),in xr4 int(100),in xr5 int(100))
begin
declare x int;
declare prom float;
	set x = (select count(*) from usuarios where usr = xusrp);
    update usuarios set r1=xr1, r2=xr2, r3=xr3, r4=xr4, r5=xr5  where usr=xusrp;
    set prom = (xr1+xr2+xr3+xr4+xr5)/5;
    update usuarios set fin = prom where usr=xusrp;
end; **
delimiter ;

drop procedure if exists contar;
delimiter **
create procedure contar(in xusr nvarchar(50))
begin 
declare x int;
	set x= (select ifnull(max(idEnt),0)+1 from entradas);
    insert into entradas(idEnt, usr, dia)
    values(x, xusr,now());
end; **
delimiter ;

select * from entradas INNER JOIN usuarios ON entradas.usr = usuarios.usr;
    
drop procedure if exists inserteUsr;
delimiter **
create procedure inserteUsr(in xbol int(20), in xusr nvarchar(50), in xtipoUsr int(3), in xmail nvarchar(50), in xpsw nvarchar(50), in xcrra nvarchar(100), 
	in xnom nvarchar(100), in xaPat nvarchar(50), in xaMat nvarchar(50))
begin
declare msj nvarchar(50);
declare existencia int;
     set existencia = (select count(*) from usuarios where usr = xusr or bol = xbol);
    if(xusr = null) THEN
		set msj = "NO PUEDES";
    end if;
    if( existencia= 0)then
		insert into usuarios(bol, usr, tipoUsr, mail, crra, psw, nom, aPat, aMat)
        values(xbol, xusr, xtipoUsr, xmail, xpsw, xcrra, xnom, xaPat, xaMat);
        set msj = "AGREGADO";
	else	
		set msj = "YA ESTA";
    end if;
select msj as Resultado;
end; **
delimiter ;

drop procedure if exists iniciarSes;
delimiter **
create procedure iniciarSes(in xusr nvarchar(50),in xpsw nvarchar(50))
begin
declare msj nvarchar(50);
declare x int;
declare existencia int;
    set existencia = (select count(*) from usuarios where usr = xusr and psw = xpsw);
    if( existencia = 0 )then
        set msj = "NO INICIAR";
	else	
		set msj = "SI INICIAR";
    end if;
select msj as Resultado, tipoUsr from usuarios where usr = xusr and psw = xpsw;
end; **
delimiter ;
select * from usuarios;

drop procedure if exists actualizarContra;
delimiter **
create procedure actualizarContra(in xusr nvarchar(50), in xpsw nvarchar(50), in xnPsw nvarchar(50))
begin
declare msj nvarchar(50);
declare x int;
	set x  = (select count(*) from usuarios where usr = xusr and psw = xpsw);
    if(x = 0 or x>1)then
		set msj = "ERROR";
	else
			update usuarios set psw = xnPsw  where usr=xusr and psw = xpsw;
			set msj = "LISTO";
	end if;
select msj as Resultado;
end; **
delimiter ; 
drop procedure if exists BorrarUser;
delimiter **
create procedure BorrarUser(in xusr nvarchar(50))
begin
declare msj nvarchar(50);
declare x int;
	set x =(select count(*) from usuarios where usr=xusr);
	if(x=0 or x>1)then
		set msj = "ERROR";
		else 
			delete from usuarios where usr=xusr;
			set msj = "BORRADO";
	end if;
    
select msj as Resultado;
end; **
delimiter ; 

drop procedure if exists consultaUsr;
delimiter **
create procedure consultaUsr()
begin
	select bol, usr, tipoUsr, mail, crra, md5(psw), nom, aPat, aMat from usuarios where tipoUsr != 1;
end; **
delimiter ;

call consultaUsr();
drop procedure if exists media;
delimiter **
create procedure media(in xnota int(100))
begin 
declare x int;
	set x= (select ifnull(max(idCalif),0)+1 from calif);
    insert into calif(idCalif, nota)
    values(x, xnota);
end; **
delimiter ;

select * from usuarios