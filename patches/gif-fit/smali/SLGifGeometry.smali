.class public final LSLGifGeometry;
.super Ljava/lang/Object;
.source "SLGifGeometry.java"


# static fields
.field public static final DEFAULT_MODE:I = 0x0

.field public static final DEFAULT_SHAPE:I = 0x0

.field public static final DEFAULT_SIZE:I = 0x5a


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static mode(I)I
    .locals 1

    .prologue
    const/4 v0, 0x1

    .line 6
    if-ne p0, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static radius(FI)F
    .locals 1

    .prologue
    .line 13
    invoke-static {p1}, LSLGifGeometry;->shape(I)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    const v0, 0x3e6147ae    # 0.22f

    mul-float/2addr v0, p0

    :goto_0
    return v0

    :pswitch_0
    const/high16 v0, 0x3f000000    # 0.5f

    mul-float/2addr v0, p0

    goto :goto_0

    :pswitch_1
    const/4 v0, 0x0

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static scale(IIFI)F
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 8
    if-lez p0, :cond_0

    if-lez p1, :cond_0

    cmpg-float v1, p2, v0

    if-gtz v1, :cond_1

    .line 10
    :cond_0
    :goto_0
    return v0

    .line 9
    :cond_1
    int-to-float v0, p0

    div-float v0, p2, v0

    int-to-float v1, p1

    div-float v1, p2, v1

    .line 10
    invoke-static {p3}, LSLGifGeometry;->mode(I)I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    goto :goto_0

    :cond_2
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    goto :goto_0
.end method

.method public static shape(I)I
    .locals 1

    .prologue
    .line 5
    if-ltz p0, :cond_0

    const/4 v0, 0x2

    if-gt p0, v0, :cond_0

    :goto_0
    return p0

    :cond_0
    const/4 p0, 0x0

    goto :goto_0
.end method

.method public static size(I)I
    .locals 2

    .prologue
    .line 4
    const/16 v0, 0x32

    const/16 v1, 0x64

    invoke-static {v1, p0}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method
