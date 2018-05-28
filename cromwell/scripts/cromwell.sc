#! /usr/local/bin/amm

import ammonite.ops._
import ammonite.ops.ImplicitWd._

@main
def mysql(tag: String = "5.7", config: Path = Path("/pipelines"), folder: Path = pwd) = {
  val base = config.toString
	%%.docker("run", "-i", "-d", "-p", "3307:3306",
        "-v", s"${config}/init/:/docker-entrypoint-initdb.d",
        "-v", s"${folder}/db:/var/lib/mysql",
        "-e", s"MYSQL_ROOT_PASSWORD=cromwell",
		    "-e", s"MYSQL_DATABASE=cromwell_db",
		    s"mysql:${tag}")(folder)
	//docker run --name some-mysql -v /my/own/datadir:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag
}

@main
def server(config: Path = (pwd / "application.conf"), jar: Path = (pwd / "cromwell.jar"), folder: Path = pwd) = {  
  %.java(s"-Dconfig.file=${config}", "-jar", s"${jar}", "server")(folder)
}
