using System.Collections.Generic;
using System.IO;
using System.Linq;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;

namespace RecycleApi.Controllers
{
	[Route("api/recycle-point")]
	[ApiController]
	public class RecyclesPointsController : ControllerBase
	{
		public RecycleContext db = new RecycleContext();

		[HttpGet]
		public ActionResult<IEnumerable<RecyclePoint>> GetAll()
		{
			var points = db.RecyclePoints;
			return points;
		}

		[HttpGet("{id}")]
		public ActionResult<RecyclePoint> Get(int id)
		{
			return db.RecyclePoints.FirstOrDefault(e => e.Id == id);
		}

		[HttpPost]
		public ActionResult<int> Post([FromBody] RecyclePoint recyclePoint)
		{
			db.RecyclePoints.Add(recyclePoint);
			db.SaveChanges();


			return db.RecyclePoints.Count();
			//return Redirect(Request.UrlReferrer.ToString());
		}

		[Route("edit")]
		[HttpGet]
		public ActionResult AddPoints()
		{
			return File(new FileStream("submit-points.html", FileMode.Open), "text/html");
		}
	}
}
