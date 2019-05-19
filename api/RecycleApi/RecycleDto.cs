using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace RecycleApi
{
	public class RecycleDto
	{
		public int Id { get; set; }
		public int RecyclePointId { get; set; }
		public int UserId { get; set; }

		public bool IsApproved { get; set; }

		public string Materials { get; set; }

		public Recycle ToRecycle()
		{
			Console.WriteLine(Materials);
			var result = new Recycle() {RecyclePointId = RecyclePointId, UserId = UserId};
			var dict = JsonConvert.DeserializeObject<Dictionary<string, int?>>(Materials);
			result.Materials = new Dictionary<MaterialType, int>();

			foreach (var e in dict)
			{
				if (e.Value.HasValue)
					result.Materials[(MaterialType)Enum.Parse(typeof(MaterialType), e.Key)] = e.Value.Value;
			}

			return result;
		}
	}
}
