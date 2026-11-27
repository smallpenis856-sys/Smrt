.class final LSLGifIcons$GifDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "SLGifIcons.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LSLGifIcons;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "GifDrawable"
.end annotation


# instance fields
.field private final clip:Landroid/graphics/RectF;

.field private final movie:Landroid/graphics/Movie;

.field private final owner:Landroid/view/View;

.field private final path:Landroid/graphics/Path;

.field private final preview:Z

.field private final start:J

.field private final style:LSLGifIcons$Style;

.field private final visible:Landroid/graphics/Rect;


# direct methods
.method constructor <init>(Landroid/view/View;Landroid/graphics/Movie;LSLGifIcons$Style;Z)V
    .locals 2

    .prologue
    .line 209
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 206
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, LSLGifIcons$GifDrawable;->visible:Landroid/graphics/Rect;

    .line 207
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, LSLGifIcons$GifDrawable;->clip:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, LSLGifIcons$GifDrawable;->path:Landroid/graphics/Path;

    .line 208
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, LSLGifIcons$GifDrawable;->start:J

    .line 209
    iput-object p1, p0, LSLGifIcons$GifDrawable;->owner:Landroid/view/View;

    iput-object p2, p0, LSLGifIcons$GifDrawable;->movie:Landroid/graphics/Movie;

    iput-object p3, p0, LSLGifIcons$GifDrawable;->style:LSLGifIcons$Style;

    iput-boolean p4, p0, LSLGifIcons$GifDrawable;->preview:Z

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 12

    .prologue
    const/4 v11, 0x0

    const/high16 v10, 0x40000000    # 2.0f

    .line 214
    invoke-virtual {p0}, LSLGifIcons$GifDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, LSLGifIcons$GifDrawable;->movie:Landroid/graphics/Movie;

    invoke-virtual {v1}, Landroid/graphics/Movie;->width()I

    move-result v1

    if-lez v1, :cond_0

    iget-object v1, p0, LSLGifIcons$GifDrawable;->movie:Landroid/graphics/Movie;

    invoke-virtual {v1}, Landroid/graphics/Movie;->height()I

    move-result v1

    if-gtz v1, :cond_1

    .line 226
    :cond_0
    :goto_0
    return-void

    .line 215
    :cond_1
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, LSLGifIcons$GifDrawable;->style:LSLGifIcons$Style;

    iget v2, v2, LSLGifIcons$Style;->size:I

    invoke-static {v2}, LSLGifGeometry;->size(I)I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x42c80000    # 100.0f

    div-float/2addr v2, v3

    mul-float/2addr v1, v2

    .line 216
    iget v2, v0, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    sub-float/2addr v3, v1

    div-float/2addr v3, v10

    add-float/2addr v2, v3

    iget v3, v0, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr v0, v1

    div-float/2addr v0, v10

    add-float/2addr v0, v3

    .line 217
    iget-object v3, p0, LSLGifIcons$GifDrawable;->movie:Landroid/graphics/Movie;

    invoke-virtual {v3}, Landroid/graphics/Movie;->width()I

    move-result v3

    iget-object v4, p0, LSLGifIcons$GifDrawable;->movie:Landroid/graphics/Movie;

    invoke-virtual {v4}, Landroid/graphics/Movie;->height()I

    move-result v4

    iget-object v5, p0, LSLGifIcons$GifDrawable;->style:LSLGifIcons$Style;

    iget v5, v5, LSLGifIcons$Style;->mode:I

    invoke-static {v3, v4, v1, v5}, LSLGifGeometry;->scale(IIFI)F

    move-result v3

    .line 218
    iget-object v4, p0, LSLGifIcons$GifDrawable;->movie:Landroid/graphics/Movie;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v6

    iget-wide v8, p0, LSLGifIcons$GifDrawable;->start:J

    sub-long/2addr v6, v8

    iget-object v5, p0, LSLGifIcons$GifDrawable;->movie:Landroid/graphics/Movie;

    invoke-virtual {v5}, Landroid/graphics/Movie;->duration()I

    move-result v5

    int-to-long v8, v5

    rem-long/2addr v6, v8

    long-to-int v5, v6

    invoke-virtual {v4, v5}, Landroid/graphics/Movie;->setTime(I)Z

    .line 219
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v4

    .line 220
    iget-object v5, p0, LSLGifIcons$GifDrawable;->clip:Landroid/graphics/RectF;

    add-float v6, v2, v1

    add-float v7, v0, v1

    invoke-virtual {v5, v2, v0, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    iget-object v5, p0, LSLGifIcons$GifDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v5}, Landroid/graphics/Path;->reset()V

    .line 221
    iget-object v5, p0, LSLGifIcons$GifDrawable;->style:LSLGifIcons$Style;

    iget v5, v5, LSLGifIcons$Style;->shape:I

    invoke-static {v1, v5}, LSLGifGeometry;->radius(FI)F

    move-result v5

    iget-object v6, p0, LSLGifIcons$GifDrawable;->path:Landroid/graphics/Path;

    iget-object v7, p0, LSLGifIcons$GifDrawable;->clip:Landroid/graphics/RectF;

    sget-object v8, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v6, v7, v5, v5, v8}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    iget-object v5, p0, LSLGifIcons$GifDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {p1, v5}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 222
    iget-object v5, p0, LSLGifIcons$GifDrawable;->movie:Landroid/graphics/Movie;

    invoke-virtual {v5}, Landroid/graphics/Movie;->width()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v3

    sub-float v5, v1, v5

    div-float/2addr v5, v10

    add-float/2addr v2, v5

    iget-object v5, p0, LSLGifIcons$GifDrawable;->movie:Landroid/graphics/Movie;

    invoke-virtual {v5}, Landroid/graphics/Movie;->height()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v3

    sub-float/2addr v1, v5

    div-float/2addr v1, v10

    add-float/2addr v0, v1

    invoke-virtual {p1, v2, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 223
    invoke-virtual {p1, v3, v3}, Landroid/graphics/Canvas;->scale(FF)V

    iget-object v0, p0, LSLGifIcons$GifDrawable;->movie:Landroid/graphics/Movie;

    invoke-virtual {v0, p1, v11, v11}, Landroid/graphics/Movie;->draw(Landroid/graphics/Canvas;FF)V

    invoke-virtual {p1, v4}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 224
    invoke-virtual {p0, p0}, LSLGifIcons$GifDrawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    .line 225
    iget-object v0, p0, LSLGifIcons$GifDrawable;->owner:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, LSLGifIcons$GifDrawable;->owner:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, LSLGifIcons$GifDrawable;->owner:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->hasWindowFocus()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, LSLGifIcons$GifDrawable;->owner:Landroid/view/View;

    iget-object v1, p0, LSLGifIcons$GifDrawable;->visible:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, LSLGifIcons$GifDrawable;->preview:Z

    if-nez v0, :cond_2

    const/16 v0, 0x14

    invoke-static {v0}, Lyb6;->a(I)Z

    move-result v0

    if-nez v0, :cond_0

    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x32

    add-long/2addr v0, v2

    invoke-virtual {p0, p0, v0, v1}, LSLGifIcons$GifDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    goto/16 :goto_0
.end method

.method public getIntrinsicHeight()I
    .locals 1

    .prologue
    .line 212
    const/16 v0, 0x100

    return v0
.end method

.method public getIntrinsicWidth()I
    .locals 1

    .prologue
    .line 211
    const/16 v0, 0x100

    return v0
.end method

.method public getOpacity()I
    .locals 1

    .prologue
    .line 230
    const/4 v0, -0x3

    return v0
.end method

.method public run()V
    .locals 0

    .prologue
    .line 227
    invoke-virtual {p0}, LSLGifIcons$GifDrawable;->invalidateSelf()V

    return-void
.end method

.method public setAlpha(I)V
    .locals 0

    .prologue
    .line 228
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .prologue
    .line 229
    return-void
.end method
