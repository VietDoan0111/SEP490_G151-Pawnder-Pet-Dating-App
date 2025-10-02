using System;
using System.Collections.Generic;

namespace BE.Models;

public partial class RequestMatch
{
    public int MatchId { get; set; }

    public int? FromUserId { get; set; }

    public int? ToUserId { get; set; }

    public string? StatusRequest { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual User? FromUser { get; set; }

    public virtual ICollection<Message> Messages { get; set; } = new List<Message>();

    public virtual User? ToUser { get; set; }
}
