import coursier.maven.MavenRepository
interp.repositories() ++= Seq(
  MavenRepository("https://dl.bintray.com/comp-bio-aging/main/")
)
@
import $ivy.`com.lihaoyi::ammonite-ops:1.6.9`
import $ivy.`com.github.pathikrit::better-files:3.8.0`
import $ivy.`io.circe::circe-core:0.12.0-RC4`
import $ivy.`io.circe::circe-generic:0.12.0-RC4`
import $ivy.`io.circe::circe-parser:0.12.0-RC4`
import $ivy.`io.circe::circe-jackson29:0.12.0-RC4`
import $ivy.`group.aging-research::ensembl-scala:0.0.2`
@
import ammonite.ops._
import better.files._
import java.io.{File => JFile}