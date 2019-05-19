using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RecycleApi
{
	public class Recycle
	{
		public int RecycleId { get; set; }
		public int RecyclePointId { get; set; }
		public int UserId { get; set; }

		public Dictionary<MaterialType, int> Materials { get; set; }

		public int CalculatePoints()
		{
			return Materials.Sum(m => m.Value);
		}
	}
}
