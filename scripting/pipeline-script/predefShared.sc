import $ivy.`com.lihaoyi::ammonite-ops:1.0.5`
import $ivy.`com.pepegar::hammock-core:0.8.1`
import $ivy.`com.pepegar::hammock-circe:0.8.1`
import $ivy.`com.github.pathikrit::better-files:3.4.0`
import $ivy.`com.nrinaudo::kantan.csv:0.4.0`
import $ivy.`com.nrinaudo::kantan.csv-generic:0.4.0`
@
import ammonite.ops._
import better.files._
import java.io.{File => JFile}
import cats.effect.IO
import io.circe.generic.auto._
import hammock._
import hammock.marshalling._
import hammock.jvm.Interpreter
import hammock.circe.implicits._
import kantan.csv._         // All kantan.csv types.
import kantan.csv.ops._     // Enriches types with useful methods.
import kantan.csv.generic._ // Automatic derivation of codecs.