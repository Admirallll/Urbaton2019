using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;

namespace RecycleApi.Controllers
{
	[Route("api/recycle")]
	[ApiController]
	public class RecycleController : ControllerBase
	{
		public RecycleContext db = new RecycleContext();

		[HttpGet]
		public ActionResult<IEnumerable<Recycle>> GetAll()
		{
			var e = db.RecycleDtos2.ToArray();
			return e.Select(r =>r.ToRecycle()).ToArray();
		}

		[HttpGet("{id}")]
		public ActionResult<Recycle> Get(int id)
		{
			var recycleDto = db.RecycleDtos2.FirstOrDefault(e => e.Id == id);
			if (recycleDto == null)
				return NotFound("Not found recycle by id");
			return recycleDto.ToRecycle();
		}

		[HttpPost]
		public void Post([FromBody] RecycleDto recycleDto)
		{
			db.RecycleDtos2.Add(recycleDto);
			db.SaveChanges();
		}
	}
}
