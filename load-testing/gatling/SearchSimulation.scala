package helixcare
import io.gatling.core.Predef._
import io.gatling.http.Predef._
import scala.concurrent.duration._
class SearchSimulation extends Simulation {
  val httpProtocol = http.baseUrl("https://helixcare.internal").acceptHeader("application/json")
  val search = scenario("Search").exec(http("query").get("/api/search?q=test"))
  setUp(search.inject(rampUsers(500) during (30.seconds), constantUsersPerSec(200) during (3.minutes))).protocols(httpProtocol)
}
