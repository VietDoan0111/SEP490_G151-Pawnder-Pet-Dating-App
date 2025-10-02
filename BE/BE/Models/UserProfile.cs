using System;
using System.Collections.Generic;

namespace BE.Models;

public partial class UserProfile
{
    public int ProfileId { get; set; }

    public string? FullName { get; set; }

    public string? Gender { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual ICollection<User> Users { get; set; } = new List<User>();
}
