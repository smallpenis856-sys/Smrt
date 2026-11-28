.class final LSLHomeSearch$Magnifier;
.super Landroid/graphics/drawable/Drawable;
.source "SLHomeSearch.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LSLHomeSearch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Magnifier"
.end annotation


# instance fields
.field final paint:Landroid/graphics/Paint;

.field final synthetic this$0:LSLHomeSearch;


# direct methods
.method private constructor <init>(LSLHomeSearch;)V
    .locals 2

    .prologue
    .line 86
    iput-object p1, p0, LSLHomeSearch$Magnifier;->this$0:LSLHomeSearch;

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 87
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, LSLHomeSearch$Magnifier;->paint:Landroid/graphics/Paint;

    return-void
.end method

.method synthetic constructor <init>(LSLHomeSearch;LSLHomeSearch$1;)V
    .locals 0

    .prologue
    .line 86
    invoke-direct {p0, p1}, LSLHomeSearch$Magnifier;-><init>(LSLHomeSearch;)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 9

    .prologue
    const v8, 0x3f6147ae    # 0.88f

    const v7, 0x3f1eb852    # 0.62f

    const v6, 0x3ed70a3d    # 0.42f

    .line 89
    invoke-virtual {p0}, LSLHomeSearch$Magnifier;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, LSLHomeSearch$Magnifier;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    iget v1, v1, Landroid/graphics/Rect;->left:I

    int-to-float v3, v1

    invoke-virtual {p0}, LSLHomeSearch$Magnifier;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    iget v1, v1, Landroid/graphics/Rect;->top:I

    int-to-float v4, v1

    .line 90
    iget-object v1, p0, LSLHomeSearch$Magnifier;->paint:Landroid/graphics/Paint;

    const v2, -0xa0a0b

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, p0, LSLHomeSearch$Magnifier;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v1, p0, LSLHomeSearch$Magnifier;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    iget-object v1, p0, LSLHomeSearch$Magnifier;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x3f800000    # 1.0f

    const v5, 0x3df5c28f    # 0.12f

    mul-float/2addr v5, v0

    invoke-static {v2, v5}, Ljava/lang/Math;->max(FF)F

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 91
    mul-float v1, v0, v6

    add-float/2addr v1, v3

    mul-float v2, v0, v6

    add-float/2addr v2, v4

    const v5, 0x3e8a3d71    # 0.27f

    mul-float/2addr v5, v0

    iget-object v6, p0, LSLHomeSearch$Magnifier;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v5, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    mul-float v1, v0, v7

    add-float/2addr v1, v3

    mul-float v2, v0, v7

    add-float/2addr v2, v4

    mul-float v5, v0, v8

    add-float/2addr v3, v5

    mul-float/2addr v0, v8

    add-float/2addr v4, v0

    iget-object v5, p0, LSLHomeSearch$Magnifier;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 92
    return-void
.end method

.method public getOpacity()I
    .locals 1

    .prologue
    .line 95
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, LSLHomeSearch$Magnifier;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-virtual {p0}, LSLHomeSearch$Magnifier;->invalidateSelf()V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, LSLHomeSearch$Magnifier;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-virtual {p0}, LSLHomeSearch$Magnifier;->invalidateSelf()V

    return-void
.end method
