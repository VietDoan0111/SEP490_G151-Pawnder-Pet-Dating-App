using System;
using System.Collections.Generic;

namespace BE.Models;

public partial class PetCharacteristic
{
    public int PetCharacteristicsId { get; set; }

    public int? PetId { get; set; }

    public int? AttributePetId { get; set; }

    public string? Value { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual PetAttribute? AttributePet { get; set; }

    public virtual Pet? Pet { get; set; }
}
