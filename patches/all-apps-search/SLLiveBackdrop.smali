.class public final Lginlemon/flower/glass/SLLiveBackdrop;
.super Landroid/view/View;
.source "SLLiveBackdrop.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# static fields
.field private static final SCALE:I = 0x4


# instance fields
.field private blurred:Landroid/graphics/Bitmap;

.field private final bounds:Landroid/graphics/RectF;

.field private capture:Landroid/graphics/Bitmap;

.field private captureCanvas:Landroid/graphics/Canvas;

.field private final clip:Landroid/graphics/Path;

.field private failed:Z

.field private final here:[I

.field private padding:I

.field private final paint:Landroid/graphics/Paint;

.field private pixels:[I

.field private previous:[I

.field private radius:I

.field private ready:Z

.field private final rim:Landroid/graphics/Paint;

.field private final sample:Landroid/graphics/Rect;

.field private scratch:[I

.field private source:Landroid/view/View;

.field private final there:[I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 12

    .prologue
    const/4 v7, 0x1

    const/4 v4, 0x0

    const/high16 v6, 0x40800000    # 4.0f

    const/4 v3, 0x2

    const/4 v1, 0x0

    .line 28
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 14
    new-instance v0, Landroid/graphics/Paint;

    const/4 v2, 0x3

    invoke-direct {v0, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->paint:Landroid/graphics/Paint;

    .line 15
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v7}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->rim:Landroid/graphics/Paint;

    .line 16
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->clip:Landroid/graphics/Path;

    .line 17
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->bounds:Landroid/graphics/RectF;

    .line 18
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->sample:Landroid/graphics/Rect;

    .line 19
    new-array v0, v3, [I

    iput-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->here:[I

    new-array v0, v3, [I

    iput-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->there:[I

    .line 29
    invoke-virtual {p0, v4}, Lginlemon/flower/glass/SLLiveBackdrop;->setClickable(Z)V

    .line 30
    invoke-virtual {p0, v4}, Lginlemon/flower/glass/SLLiveBackdrop;->setFocusable(Z)V

    .line 31
    invoke-virtual {p0, v3}, Lginlemon/flower/glass/SLLiveBackdrop;->setImportantForAccessibility(I)V

    .line 32
    invoke-virtual {p0}, Lginlemon/flower/glass/SLLiveBackdrop;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v2, v0, Landroid/util/DisplayMetrics;->density:F

    .line 33
    const/high16 v0, 0x41a00000    # 20.0f

    mul-float/2addr v0, v2

    div-float/2addr v0, v6

    float-to-double v4, v0

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-int v0, v4

    mul-int/lit8 v0, v0, 0x4

    iput v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->padding:I

    .line 34
    const/high16 v0, 0x40c00000    # 6.0f

    mul-float/2addr v0, v2

    div-float/2addr v0, v6

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-static {v7, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->radius:I

    .line 35
    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->paint:Landroid/graphics/Paint;

    const/16 v3, 0xd2

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 36
    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->rim:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 37
    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->rim:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 38
    iget-object v8, p0, Lginlemon/flower/glass/SLLiveBackdrop;->rim:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/LinearGradient;

    const/high16 v3, 0x42600000    # 56.0f

    mul-float v4, v3, v2

    const v5, -0x7f000001

    const v6, 0x18ffffff

    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    move v2, v1

    move v3, v1

    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 40
    return-void
.end method

.method static blur([I[IIII)V
    .registers 12

    .prologue
    .line 134
    if-lez p2, :cond_10

    if-lez p3, :cond_10

    const/4 v0, 0x1

    if-lt p4, v0, :cond_10

    array-length v0, p0

    mul-int v1, p2, p3

    if-ne v0, v1, :cond_10

    array-length v0, p1

    array-length v1, p0

    if-eq v0, v1, :cond_18

    .line 135
    :cond_10
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid blur buffers"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 136
    :cond_18
    const/4 v0, 0x0

    :goto_19
    array-length v1, p0

    if-ge v0, v1, :cond_41

    .line 137
    aget v1, p0, v0

    ushr-int/lit8 v2, v1, 0x18

    .line 138
    shl-int/lit8 v3, v2, 0x18

    ushr-int/lit8 v4, v1, 0x10

    and-int/lit16 v4, v4, 0xff

    mul-int/2addr v4, v2

    div-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x10

    or-int/2addr v3, v4

    ushr-int/lit8 v4, v1, 0x8

    and-int/lit16 v4, v4, 0xff

    mul-int/2addr v4, v2

    div-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x8

    or-int/2addr v3, v4

    and-int/lit16 v1, v1, 0xff

    mul-int/2addr v1, v2

    div-int/lit16 v1, v1, 0xff

    or-int/2addr v1, v3

    aput v1, p0, v0

    .line 136
    add-int/lit8 v0, v0, 0x1

    goto :goto_19

    .line 141
    :cond_41
    const/4 v0, 0x0

    move v6, v0

    :goto_43
    const/4 v0, 0x2

    if-ge v6, v0, :cond_5c

    .line 142
    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-static/range {v0 .. v5}, Lginlemon/flower/glass/SLLiveBackdrop;->box([I[IIIIZ)V

    .line 143
    const/4 v5, 0x0

    move-object v0, p1

    move-object v1, p0

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-static/range {v0 .. v5}, Lginlemon/flower/glass/SLLiveBackdrop;->box([I[IIIIZ)V

    .line 141
    add-int/lit8 v0, v6, 0x1

    move v6, v0

    goto :goto_43

    .line 145
    :cond_5c
    const/4 v0, 0x0

    :goto_5d
    array-length v1, p0

    if-ge v0, v1, :cond_9b

    .line 146
    aget v1, p0, v0

    ushr-int/lit8 v2, v1, 0x18

    .line 147
    if-nez v2, :cond_6c

    const/4 v1, 0x0

    .line 148
    :goto_67
    aput v1, p0, v0

    .line 145
    add-int/lit8 v0, v0, 0x1

    goto :goto_5d

    .line 148
    :cond_6c
    shl-int/lit8 v3, v2, 0x18

    const/16 v4, 0xff

    ushr-int/lit8 v5, v1, 0x10

    and-int/lit16 v5, v5, 0xff

    mul-int/lit16 v5, v5, 0xff

    div-int/2addr v5, v2

    .line 147
    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    shl-int/lit8 v4, v4, 0x10

    or-int/2addr v3, v4

    const/16 v4, 0xff

    ushr-int/lit8 v5, v1, 0x8

    and-int/lit16 v5, v5, 0xff

    mul-int/lit16 v5, v5, 0xff

    div-int/2addr v5, v2

    .line 148
    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    shl-int/lit8 v4, v4, 0x8

    or-int/2addr v3, v4

    const/16 v4, 0xff

    and-int/lit16 v1, v1, 0xff

    mul-int/lit16 v1, v1, 0xff

    div-int/2addr v1, v2

    invoke-static {v4, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    or-int/2addr v1, v3

    goto :goto_67

    .line 150
    :cond_9b
    return-void
.end method

.method private static box([I[IIIIZ)V
    .registers 21

    .prologue
    .line 153
    if-eqz p5, :cond_43

    move/from16 v9, p2

    :goto_4
    if-eqz p5, :cond_46

    .line 154
    :goto_6
    if-eqz p5, :cond_49

    const/4 v1, 0x1

    :goto_9
    mul-int/lit8 v2, p4, 0x2

    add-int/lit8 v10, v2, 0x1

    .line 155
    const/4 v3, 0x0

    :goto_e
    move/from16 v0, p3

    if-ge v3, v0, :cond_a8

    .line 156
    if-eqz p5, :cond_4c

    mul-int v2, v3, p2

    .line 157
    :goto_16
    const/4 v8, 0x0

    const/4 v7, 0x0

    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 158
    move/from16 v0, p4

    neg-int v4, v0

    :goto_1d
    move/from16 v0, p4

    if-gt v4, v0, :cond_4e

    .line 159
    const/4 v11, 0x0

    add-int/lit8 v12, v9, -0x1

    invoke-static {v12, v4}, Ljava/lang/Math;->min(II)I

    move-result v12

    invoke-static {v11, v12}, Ljava/lang/Math;->max(II)I

    move-result v11

    mul-int/2addr v11, v1

    add-int/2addr v11, v2

    aget v11, p0, v11

    .line 160
    ushr-int/lit8 v12, v11, 0x18

    add-int/2addr v8, v12

    ushr-int/lit8 v12, v11, 0x10

    and-int/lit16 v12, v12, 0xff

    add-int/2addr v7, v12

    ushr-int/lit8 v12, v11, 0x8

    and-int/lit16 v12, v12, 0xff

    add-int/2addr v6, v12

    and-int/lit16 v11, v11, 0xff

    add-int/2addr v5, v11

    .line 158
    add-int/lit8 v4, v4, 0x1

    goto :goto_1d

    :cond_43
    move/from16 v9, p3

    .line 153
    goto :goto_4

    :cond_46
    move/from16 p3, p2

    goto :goto_6

    :cond_49
    move/from16 v1, p2

    .line 154
    goto :goto_9

    :cond_4c
    move v2, v3

    .line 156
    goto :goto_16

    .line 162
    :cond_4e
    const/4 v4, 0x0

    :goto_4f
    if-ge v4, v9, :cond_a4

    .line 163
    mul-int v11, v4, v1

    add-int/2addr v11, v2

    div-int v12, v8, v10

    shl-int/lit8 v12, v12, 0x18

    div-int v13, v7, v10

    shl-int/lit8 v13, v13, 0x10

    or-int/2addr v12, v13

    div-int v13, v6, v10

    shl-int/lit8 v13, v13, 0x8

    or-int/2addr v12, v13

    div-int v13, v5, v10

    or-int/2addr v12, v13

    aput v12, p1, v11

    .line 164
    const/4 v11, 0x0

    sub-int v12, v4, p4

    invoke-static {v11, v12}, Ljava/lang/Math;->max(II)I

    move-result v11

    mul-int/2addr v11, v1

    add-int/2addr v11, v2

    aget v11, p0, v11

    .line 165
    add-int/lit8 v12, v9, -0x1

    add-int v13, v4, p4

    add-int/lit8 v13, v13, 0x1

    invoke-static {v12, v13}, Ljava/lang/Math;->min(II)I

    move-result v12

    mul-int/2addr v12, v1

    add-int/2addr v12, v2

    aget v12, p0, v12

    .line 166
    ushr-int/lit8 v13, v12, 0x18

    ushr-int/lit8 v14, v11, 0x18

    sub-int/2addr v13, v14

    add-int/2addr v8, v13

    .line 167
    ushr-int/lit8 v13, v12, 0x10

    and-int/lit16 v13, v13, 0xff

    ushr-int/lit8 v14, v11, 0x10

    and-int/lit16 v14, v14, 0xff

    sub-int/2addr v13, v14

    add-int/2addr v7, v13

    .line 168
    ushr-int/lit8 v13, v12, 0x8

    and-int/lit16 v13, v13, 0xff

    ushr-int/lit8 v14, v11, 0x8

    and-int/lit16 v14, v14, 0xff

    sub-int/2addr v13, v14

    add-int/2addr v6, v13

    .line 169
    and-int/lit16 v12, v12, 0xff

    and-int/lit16 v11, v11, 0xff

    sub-int v11, v12, v11

    add-int/2addr v5, v11

    .line 162
    add-int/lit8 v4, v4, 0x1

    goto :goto_4f

    .line 155
    :cond_a4
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_e

    .line 172
    :cond_a8
    return-void
.end method

.method private release()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 56
    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->capture:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->capture:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 57
    :cond_a
    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->blurred:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_13

    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->blurred:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 58
    :cond_13
    iput-object v1, p0, Lginlemon/flower/glass/SLLiveBackdrop;->blurred:Landroid/graphics/Bitmap;

    iput-object v1, p0, Lginlemon/flower/glass/SLLiveBackdrop;->capture:Landroid/graphics/Bitmap;

    .line 59
    iput-object v1, p0, Lginlemon/flower/glass/SLLiveBackdrop;->captureCanvas:Landroid/graphics/Canvas;

    .line 60
    iput-object v1, p0, Lginlemon/flower/glass/SLLiveBackdrop;->scratch:[I

    iput-object v1, p0, Lginlemon/flower/glass/SLLiveBackdrop;->previous:[I

    iput-object v1, p0, Lginlemon/flower/glass/SLLiveBackdrop;->pixels:[I

    .line 61
    const/4 v0, 0x0

    iput-boolean v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->ready:Z

    .line 62
    return-void
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .registers 2

    .prologue
    .line 43
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 44
    const/4 v0, 0x0

    iput-boolean v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->failed:Z

    .line 45
    invoke-virtual {p0}, Lginlemon/flower/glass/SLLiveBackdrop;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 46
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 49
    invoke-virtual {p0}, Lginlemon/flower/glass/SLLiveBackdrop;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->source:Landroid/view/View;

    .line 51
    invoke-direct {p0}, Lginlemon/flower/glass/SLLiveBackdrop;->release()V

    .line 52
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 53
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 11

    .prologue
    const/high16 v6, 0x40000000    # 2.0f

    .line 121
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 122
    iget-boolean v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->ready:Z

    if-nez v0, :cond_a

    .line 130
    :goto_9
    return-void

    .line 123
    :cond_a
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v8

    .line 124
    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->clip:Landroid/graphics/Path;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 125
    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->blurred:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lginlemon/flower/glass/SLLiveBackdrop;->sample:Landroid/graphics/Rect;

    iget-object v2, p0, Lginlemon/flower/glass/SLLiveBackdrop;->bounds:Landroid/graphics/RectF;

    iget-object v3, p0, Lginlemon/flower/glass/SLLiveBackdrop;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 126
    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->rim:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v0

    div-float v1, v0, v6

    .line 127
    invoke-virtual {p0}, Lginlemon/flower/glass/SLLiveBackdrop;->getWidth()I

    move-result v0

    int-to-float v0, v0

    sub-float v3, v0, v1

    invoke-virtual {p0}, Lginlemon/flower/glass/SLLiveBackdrop;->getHeight()I

    move-result v0

    int-to-float v0, v0

    sub-float v4, v0, v1

    .line 128
    invoke-virtual {p0}, Lginlemon/flower/glass/SLLiveBackdrop;->getHeight()I

    move-result v0

    int-to-float v0, v0

    div-float v5, v0, v6

    invoke-virtual {p0}, Lginlemon/flower/glass/SLLiveBackdrop;->getHeight()I

    move-result v0

    int-to-float v0, v0

    div-float v6, v0, v6

    iget-object v7, p0, Lginlemon/flower/glass/SLLiveBackdrop;->rim:Landroid/graphics/Paint;

    move-object v0, p1

    move v2, v1

    .line 127
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 129
    invoke-virtual {p1, v8}, Landroid/graphics/Canvas;->restoreToCount(I)V

    goto :goto_9
.end method

.method public onPreDraw()Z
    .registers 10

    .prologue
    const/4 v8, 0x1

    .line 72
    iget-boolean v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->failed:Z

    if-nez v0, :cond_17

    invoke-virtual {p0}, Lginlemon/flower/glass/SLLiveBackdrop;->isShown()Z

    move-result v0

    if-eqz v0, :cond_17

    invoke-virtual {p0}, Lginlemon/flower/glass/SLLiveBackdrop;->getWidth()I

    move-result v0

    if-lez v0, :cond_17

    invoke-virtual {p0}, Lginlemon/flower/glass/SLLiveBackdrop;->getHeight()I

    move-result v0

    if-gtz v0, :cond_18

    .line 117
    :cond_17
    :goto_17
    return v8

    .line 73
    :cond_18
    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->source:Landroid/view/View;

    if-nez v0, :cond_40

    invoke-virtual {p0}, Lginlemon/flower/glass/SLLiveBackdrop;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/View;

    if-eqz v0, :cond_40

    .line 74
    invoke-virtual {p0}, Lginlemon/flower/glass/SLLiveBackdrop;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 75
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/view/View;

    if-eqz v1, :cond_40

    .line 76
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    const-string v1, "live_drawer_source"

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->source:Landroid/view/View;

    .line 78
    :cond_40
    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->source:Landroid/view/View;

    if-eqz v0, :cond_17

    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->source:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v0

    if-eqz v0, :cond_17

    .line 80
    :try_start_4c
    invoke-virtual {p0}, Lginlemon/flower/glass/SLLiveBackdrop;->getWidth()I

    move-result v0

    iget v1, p0, Lginlemon/flower/glass/SLLiveBackdrop;->padding:I

    mul-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, -0x1

    div-int/lit8 v3, v0, 0x4

    .line 81
    invoke-virtual {p0}, Lginlemon/flower/glass/SLLiveBackdrop;->getHeight()I

    move-result v0

    iget v1, p0, Lginlemon/flower/glass/SLLiveBackdrop;->padding:I

    mul-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, -0x1

    div-int/lit8 v7, v0, 0x4

    .line 82
    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->capture:Landroid/graphics/Bitmap;

    if-nez v0, :cond_99

    .line 83
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v7, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->capture:Landroid/graphics/Bitmap;

    .line 84
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v7, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->blurred:Landroid/graphics/Bitmap;

    .line 85
    new-instance v0, Landroid/graphics/Canvas;

    iget-object v1, p0, Lginlemon/flower/glass/SLLiveBackdrop;->capture:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->captureCanvas:Landroid/graphics/Canvas;

    .line 86
    mul-int v0, v3, v7

    new-array v0, v0, [I

    iput-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->pixels:[I

    .line 87
    mul-int v0, v3, v7

    new-array v0, v0, [I

    iput-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->previous:[I

    .line 88
    mul-int v0, v3, v7

    new-array v0, v0, [I

    iput-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->scratch:[I

    .line 90
    :cond_99
    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->here:[I

    invoke-virtual {p0, v0}, Lginlemon/flower/glass/SLLiveBackdrop;->getLocationInWindow([I)V

    .line 91
    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->source:Landroid/view/View;

    iget-object v1, p0, Lginlemon/flower/glass/SLLiveBackdrop;->there:[I

    invoke-virtual {v0, v1}, Landroid/view/View;->getLocationInWindow([I)V

    .line 92
    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->capture:Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 93
    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->captureCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v0}, Landroid/graphics/Canvas;->save()I
    :try_end_b0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_4c .. :try_end_b0} :catch_149
    .catch Ljava/lang/IllegalStateException; {:try_start_4c .. :try_end_b0} :catch_162

    move-result v1

    .line 95
    :try_start_b1
    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->captureCanvas:Landroid/graphics/Canvas;

    const/high16 v2, 0x3e800000    # 0.25f

    const/high16 v4, 0x3e800000    # 0.25f

    invoke-virtual {v0, v2, v4}, Landroid/graphics/Canvas;->scale(FF)V

    .line 96
    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->captureCanvas:Landroid/graphics/Canvas;

    iget v2, p0, Lginlemon/flower/glass/SLLiveBackdrop;->padding:I

    iget-object v4, p0, Lginlemon/flower/glass/SLLiveBackdrop;->there:[I

    const/4 v5, 0x0

    aget v4, v4, v5

    add-int/2addr v2, v4

    iget-object v4, p0, Lginlemon/flower/glass/SLLiveBackdrop;->here:[I

    const/4 v5, 0x0

    aget v4, v4, v5

    sub-int/2addr v2, v4

    int-to-float v2, v2

    iget v4, p0, Lginlemon/flower/glass/SLLiveBackdrop;->padding:I

    iget-object v5, p0, Lginlemon/flower/glass/SLLiveBackdrop;->there:[I

    const/4 v6, 0x1

    aget v5, v5, v6

    add-int/2addr v4, v5

    iget-object v5, p0, Lginlemon/flower/glass/SLLiveBackdrop;->here:[I

    const/4 v6, 0x1

    aget v5, v5, v6

    sub-int/2addr v4, v5

    int-to-float v4, v4

    invoke-virtual {v0, v2, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 97
    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->source:Landroid/view/View;

    iget-object v2, p0, Lginlemon/flower/glass/SLLiveBackdrop;->captureCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v0, v2}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V
    :try_end_e4
    .catchall {:try_start_b1 .. :try_end_e4} :catchall_15b

    .line 99
    :try_start_e4
    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->captureCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 101
    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->capture:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lginlemon/flower/glass/SLLiveBackdrop;->pixels:[I

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move v6, v3

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 102
    iget-boolean v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->ready:Z

    if-eqz v0, :cond_102

    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->pixels:[I

    iget-object v1, p0, Lginlemon/flower/glass/SLLiveBackdrop;->previous:[I

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v0

    if-nez v0, :cond_17

    .line 103
    :cond_102
    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->pixels:[I

    const/4 v1, 0x0

    iget-object v2, p0, Lginlemon/flower/glass/SLLiveBackdrop;->previous:[I

    const/4 v4, 0x0

    iget-object v5, p0, Lginlemon/flower/glass/SLLiveBackdrop;->pixels:[I

    array-length v5, v5

    invoke-static {v0, v1, v2, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 104
    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->pixels:[I

    iget-object v1, p0, Lginlemon/flower/glass/SLLiveBackdrop;->scratch:[I

    iget v2, p0, Lginlemon/flower/glass/SLLiveBackdrop;->radius:I

    invoke-static {v0, v1, v3, v7, v2}, Lginlemon/flower/glass/SLLiveBackdrop;->blur([I[IIII)V

    .line 105
    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->blurred:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lginlemon/flower/glass/SLLiveBackdrop;->pixels:[I

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move v6, v3

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    .line 106
    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->sample:Landroid/graphics/Rect;

    iget v1, p0, Lginlemon/flower/glass/SLLiveBackdrop;->padding:I

    div-int/lit8 v1, v1, 0x4

    iget v2, p0, Lginlemon/flower/glass/SLLiveBackdrop;->padding:I

    div-int/lit8 v2, v2, 0x4

    iget v3, p0, Lginlemon/flower/glass/SLLiveBackdrop;->padding:I

    .line 107
    invoke-virtual {p0}, Lginlemon/flower/glass/SLLiveBackdrop;->getWidth()I

    move-result v4

    add-int/2addr v3, v4

    div-int/lit8 v3, v3, 0x4

    iget v4, p0, Lginlemon/flower/glass/SLLiveBackdrop;->padding:I

    invoke-virtual {p0}, Lginlemon/flower/glass/SLLiveBackdrop;->getHeight()I

    move-result v5

    add-int/2addr v4, v5

    div-int/lit8 v4, v4, 0x4

    .line 106
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 108
    const/4 v0, 0x1

    iput-boolean v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->ready:Z

    .line 109
    invoke-virtual {p0}, Lginlemon/flower/glass/SLLiveBackdrop;->invalidate()V
    :try_end_147
    .catch Ljava/lang/IllegalArgumentException; {:try_start_e4 .. :try_end_147} :catch_149
    .catch Ljava/lang/IllegalStateException; {:try_start_e4 .. :try_end_147} :catch_162

    goto/16 :goto_17

    .line 110
    :catch_149
    move-exception v0

    .line 112
    :goto_14a
    const-string v1, "SLLiveBackdrop"

    const-string v2, "Icon capture unavailable; retaining native glass"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 113
    iput-boolean v8, p0, Lginlemon/flower/glass/SLLiveBackdrop;->failed:Z

    .line 114
    invoke-direct {p0}, Lginlemon/flower/glass/SLLiveBackdrop;->release()V

    .line 115
    invoke-virtual {p0}, Lginlemon/flower/glass/SLLiveBackdrop;->invalidate()V

    goto/16 :goto_17

    .line 99
    :catchall_15b
    move-exception v0

    :try_start_15c
    iget-object v2, p0, Lginlemon/flower/glass/SLLiveBackdrop;->captureCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v2, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 100
    throw v0
    :try_end_162
    .catch Ljava/lang/IllegalArgumentException; {:try_start_15c .. :try_end_162} :catch_149
    .catch Ljava/lang/IllegalStateException; {:try_start_15c .. :try_end_162} :catch_162

    .line 110
    :catch_162
    move-exception v0

    goto :goto_14a
.end method

.method protected onSizeChanged(IIII)V
    .registers 10

    .prologue
    const/high16 v4, 0x40000000    # 2.0f

    const/4 v3, 0x0

    .line 65
    invoke-direct {p0}, Lginlemon/flower/glass/SLLiveBackdrop;->release()V

    .line 66
    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->bounds:Landroid/graphics/RectF;

    int-to-float v1, p1

    int-to-float v2, p2

    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 67
    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->clip:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 68
    iget-object v0, p0, Lginlemon/flower/glass/SLLiveBackdrop;->clip:Landroid/graphics/Path;

    iget-object v1, p0, Lginlemon/flower/glass/SLLiveBackdrop;->bounds:Landroid/graphics/RectF;

    int-to-float v2, p2

    div-float/2addr v2, v4

    int-to-float v3, p2

    div-float/2addr v3, v4

    sget-object v4, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    .line 69
    return-void
.end method
