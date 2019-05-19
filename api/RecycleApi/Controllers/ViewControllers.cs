using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace RecycleApi.Controllers
{
	public class ViewControllers : ControllerBase
	{
		private static string pathPrefix = "Views\\";

		[Route("login")]
		[HttpGet]
		public ActionResult Login()
		{
			return File(new FileStream(pathPrefix + "login.html", FileMode.Open), "text/html");
		}

		[Route("register")]
		[HttpGet]
		public ActionResult Register()
		{
			return File(new FileStream(pathPrefix + "register.html", FileMode.Open), "text/html");
		}


		[Route("/")]
		[HttpGet]
		public ActionResult Index()
		{
			return Redirect("/info");
		}

		[Route("statistics")]
		[HttpGet]
		public ActionResult Statistics()
		{
			return File(new FileStream(pathPrefix + "statistics.html", FileMode.Open), "text/html");
		}

		[Route("info")]
		[HttpGet]
		public ActionResult Info()
		{
			return File(new FileStream(pathPrefix + "info.html", FileMode.Open), "text/html");
		}

		[Route("map")]
		[HttpGet]
		public ActionResult Map()
		{
			return File(new FileStream(pathPrefix + "map.html", FileMode.Open), "text/html");
		}
		

		[Route("/images/{imageName}")]
		[HttpGet]
		public ActionResult Images(string imageName)
		{
			return File(new FileStream("images/" + imageName, FileMode.Open), "image/png");
		}

		[HttpGet]
		[Route("owner/statistics")]
		public ActionResult OwnerStat()
		{
			return File(new FileStream(pathPrefix + "owner-statistics.html", FileMode.Open), "text/html");
		}
		[HttpGet]
		[Route("owner/create-recycle")]
		public ActionResult CreateRecycle()
		{
			return File(new FileStream(pathPrefix + "create-recycle.html", FileMode.Open), "text/html");
		}
		[HttpGet]
		[Route("owner/show-code")]
		public ActionResult ShowCode()
		{
			return File(new FileStream(pathPrefix + "show-code.html", FileMode.Open), "text/html");
		}
		[HttpGet]
		[Route("code")]
		public ActionResult EnterCode()
		{
			return File(new FileStream(pathPrefix + "enter-code.html", FileMode.Open), "text/html");
		}
		[HttpGet]
		[Route("rating")]
		public ActionResult Rating()
		{
			return File(new FileStream(pathPrefix + "rating.html", FileMode.Open), "text/html");
		}
		[HttpGet]
		[Route("scripts.js")]
		public ActionResult Scripts()
		{
			return File(new FileStream("scripts.js", FileMode.Open), "text/javascript");
		}
	}
}
