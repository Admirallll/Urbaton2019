using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace RecycleApi.Controllers
{
	[Route("api")]
	public class RatingController : ControllerBase
	{
		public RecycleContext db = new RecycleContext();

		[Route("rating")]
		[HttpGet]
		public ActionResult<IEnumerable<UserInRating>> Rating()
		{
			var recycles = db.RecycleDtos2.ToArray();
			var dict = new Dictionary<int, string>();
			foreach (var u in db.Users)
			{
				Console.WriteLine(u.Id + " " + u.Login);
				dict[u.Id] = u.Login;
			}
			var grouped = recycles.GroupBy(r => r.UserId, r => r.ToRecycle().CalculatePoints(), (key, values) => new UserInRating {UserId = key, UserScore = values.Sum()}).ToArray();
			foreach (var e in grouped.ToArray())
			{
				if (dict.ContainsKey(e.UserId))
					e.UserName = dict[e.UserId];
			}
			return grouped.OrderByDescending(u => u.UserScore).ToList();
		}
	}
}
