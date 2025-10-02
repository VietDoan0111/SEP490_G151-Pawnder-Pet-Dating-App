using System;
using System.Collections.Generic;

namespace BE.Models;

public partial class User
{
    public int UserId { get; set; }

    public int? RoleId { get; set; }

    public int? ProfileId { get; set; }

    public int? UserStatusId { get; set; }

    public int? PetId { get; set; }

    public int? LocationId { get; set; }

    public string Email { get; set; } = null!;

    public string PasswordHash { get; set; } = null!;

    public string? TokenJwt { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual ICollection<Block> BlockFromUsers { get; set; } = new List<Block>();

    public virtual ICollection<Block> BlockToUsers { get; set; } = new List<Block>();

    public virtual Location? Location { get; set; }

    public virtual ICollection<Message> Messages { get; set; } = new List<Message>();

    public virtual ICollection<Notification> Notifications { get; set; } = new List<Notification>();

    public virtual ICollection<PaymentHistory> PaymentHistories { get; set; } = new List<PaymentHistory>();

    public virtual UserProfile? Profile { get; set; }

    public virtual ICollection<Report> ReportFromUsers { get; set; } = new List<Report>();

    public virtual ICollection<Report> ReportToUsers { get; set; } = new List<Report>();

    public virtual ICollection<RequestMatch> RequestMatchFromUsers { get; set; } = new List<RequestMatch>();

    public virtual ICollection<RequestMatch> RequestMatchToUsers { get; set; } = new List<RequestMatch>();

    public virtual Role? Role { get; set; }

    public virtual ICollection<UserPreference> UserPreferences { get; set; } = new List<UserPreference>();

    public virtual UserStatus? UserStatus { get; set; }
}
