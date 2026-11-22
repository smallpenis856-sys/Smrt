.class public final Lginlemon/flower/glance/SLGlancePolicy;
.super Ljava/lang/Object;
.source "SLGlancePolicy.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static choose(IZZZZ)I
    .registers 6

    .prologue
    .line 10
    if-eqz p1, :cond_a

    if-ltz p0, :cond_a

    const/16 v0, 0x14

    if-gt p0, v0, :cond_a

    const/4 v0, 0x1

    .line 14
    :goto_9
    return v0

    .line 11
    :cond_a
    if-eqz p2, :cond_e

    const/4 v0, 0x2

    goto :goto_9

    .line 12
    :cond_e
    if-eqz p3, :cond_12

    const/4 v0, 0x3

    goto :goto_9

    .line 13
    :cond_12
    if-eqz p4, :cond_16

    const/4 v0, 0x4

    goto :goto_9

    .line 14
    :cond_16
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public static eventVisible(JJJ)Z
    .registers 10

    .prologue
    .line 7
    cmp-long v0, p2, p4

    if-ltz v0, :cond_f

    sub-long v0, p0, p4

    const-wide/32 v2, 0x36ee80

    cmp-long v0, v0, v2

    if-gtz v0, :cond_f

    const/4 v0, 0x1

    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method
