package helixcare
import io.gatling.core.Predef._
import io.gatling.http.Predef._
import scala.concurrent.duration._
class CommerceSimulation extends Simulation {
  val httpProtocol = http.baseUrl("https://helixcare.internal").acceptHeader("application/json")
  val browse = scenario("Browse").exec(http("list").get("/api/list")).pause(1).exec(http("detail").get("/api/detail/sample-id"))
  setUp(browse.inject(rampUsers(200) during (60.seconds), constantUsersPerSec(50) during (5.minutes))).protocols(httpProtocol).assertions(global.responseTime.percentile3.lt(800))
}
