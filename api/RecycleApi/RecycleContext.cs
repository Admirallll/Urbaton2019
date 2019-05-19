using System.Data.Entity;

namespace RecycleApi
{
	public class RecycleContext : DbContext
	{
		public DbSet<RecyclePoint> RecyclePoints { get; set; }
		public DbSet<User> Users { get; set; }
		//public DbSet<RecycleDto> Recycles { get; set; }
		public DbSet<RecycleDto> RecycleDtos2 { get; set; }
		public DbSet<Code> Codes { get; set; }
	}
}
