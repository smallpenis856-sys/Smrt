.class public final LSLPhotoPolicy;
.super Ljava/lang/Object;
.source "SLPhotoPolicy.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static sampleSize(III)I
    .registers 6

    .prologue
    const v0, 0x8000

    .line 5
    if-lez p0, :cond_d

    if-lez p1, :cond_d

    if-gt p0, v0, :cond_d

    if-gt p1, v0, :cond_d

    if-gtz p2, :cond_f

    :cond_d
    const/4 v0, 0x0

    .line 9
    :cond_e
    return v0

    .line 6
    :cond_f
    invoke-static {p0, p1}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 7
    const/4 v0, 0x1

    .line 8
    :goto_14
    const/16 v2, 0x4000

    if-gt v0, v2, :cond_e

    mul-int/lit8 v2, v0, 0x2

    div-int v2, v1, v2

    if-lt v2, p2, :cond_e

    mul-int/lit8 v0, v0, 0x2

    goto :goto_14
.end method
