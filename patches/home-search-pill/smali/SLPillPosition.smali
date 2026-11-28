.class public final LSLPillPosition;
.super Ljava/lang/Object;
.source "SLPillPosition.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static top(IIIIII)I
    .locals 2

    .prologue
    const/4 v1, -0x1

    .line 4
    if-lez p0, :cond_0

    if-gtz p3, :cond_1

    .line 10
    :cond_0
    :goto_0
    return v1

    .line 6
    :cond_1
    if-le p1, p5, :cond_4

    if-gt p1, p0, :cond_4

    invoke-static {p0, p1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 7
    :goto_1
    if-le p2, p5, :cond_2

    if-gt p2, p0, :cond_2

    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 8
    :cond_2
    if-eq v0, p0, :cond_0

    .line 9
    sub-int/2addr v0, p4

    sub-int/2addr v0, p3

    .line 10
    if-lt v0, p5, :cond_3

    :goto_2
    move v1, v0

    goto :goto_0

    :cond_3
    move v0, v1

    goto :goto_2

    :cond_4
    move v0, p0

    goto :goto_1
.end method
