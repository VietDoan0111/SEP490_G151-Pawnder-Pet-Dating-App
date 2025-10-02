using System;
using System.Collections.Generic;

namespace BE.Models;

public partial class Message
{
    public int MessagesId { get; set; }

    public int? MatchId { get; set; }

    public int? UserId { get; set; }

    public string? Content { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual RequestMatch? Match { get; set; }

    public virtual User? User { get; set; }
}
