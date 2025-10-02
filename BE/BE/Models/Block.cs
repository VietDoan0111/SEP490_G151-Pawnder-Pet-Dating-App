﻿using System;
using System.Collections.Generic;

namespace BE.Models;

public partial class Block
{
    public int BlockId { get; set; }

    public int? FromUserId { get; set; }

    public int? ToUserId { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual User? FromUser { get; set; }

    public virtual User? ToUser { get; set; }
}
