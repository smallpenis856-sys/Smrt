.class LSLSearchAnimation$1;
.super Ljava/lang/Object;
.source "SLSearchAnimation.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LSLSearchAnimation;->onPreDraw()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:LSLSearchAnimation;


# direct methods
.method constructor <init>(LSLSearchAnimation;)V
    .locals 0

    .prologue
    .line 53
    iput-object p1, p0, LSLSearchAnimation$1;->this$0:LSLSearchAnimation;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 9

    .prologue
    const/high16 v4, 0x40000000    # 2.0f

    const/4 v2, 0x0

    .line 55
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 56
    iget-object v1, p0, LSLSearchAnimation$1;->this$0:LSLSearchAnimation;

    invoke-static {v1}, LSLSearchAnimation;->access$000(LSLSearchAnimation;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v1

    int-to-float v1, v1

    iget-object v3, p0, LSLSearchAnimation$1;->this$0:LSLSearchAnimation;

    invoke-static {v3}, LSLSearchAnimation;->access$000(LSLSearchAnimation;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v3, v4

    add-float/2addr v3, v1

    .line 57
    iget-object v1, p0, LSLSearchAnimation$1;->this$0:LSLSearchAnimation;

    invoke-static {v1}, LSLSearchAnimation;->access$000(LSLSearchAnimation;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v0, v1

    div-float v4, v0, v4

    move v1, v2

    .line 58
    :goto_0
    iget-object v0, p0, LSLSearchAnimation$1;->this$0:LSLSearchAnimation;

    invoke-static {v0}, LSLSearchAnimation;->access$100(LSLSearchAnimation;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_1

    .line 59
    iget-object v0, p0, LSLSearchAnimation$1;->this$0:LSLSearchAnimation;

    invoke-static {v0}, LSLSearchAnimation;->access$100(LSLSearchAnimation;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v0}, Landroid/view/View;->getTranslationX()F

    move-result v6

    add-float/2addr v5, v6

    .line 60
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v6

    sub-float v7, v3, v4

    sub-float/2addr v7, v5

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v6

    invoke-static {v2, v6}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 61
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v7

    add-float v8, v3, v4

    sub-float v5, v8, v5

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    invoke-static {v7, v5}, Ljava/lang/Math;->min(II)I

    move-result v5

    invoke-static {v6, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 62
    iget-object v7, p0, LSLSearchAnimation$1;->this$0:LSLSearchAnimation;

    invoke-static {v7}, LSLSearchAnimation;->access$200(LSLSearchAnimation;)[Landroid/graphics/Rect;

    move-result-object v7

    aget-object v7, v7, v1

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v8

    invoke-virtual {v7, v6, v2, v5, v8}, Landroid/graphics/Rect;->set(IIII)V

    .line 63
    iget-object v5, p0, LSLSearchAnimation$1;->this$0:LSLSearchAnimation;

    invoke-static {v5}, LSLSearchAnimation;->access$300(LSLSearchAnimation;)[Landroid/graphics/Rect;

    move-result-object v5

    aget-object v5, v5, v1

    .line 64
    if-eqz v5, :cond_0

    invoke-virtual {v7, v5}, Landroid/graphics/Rect;->intersect(Landroid/graphics/Rect;)Z

    move-result v5

    if-nez v5, :cond_0

    invoke-virtual {v7, v2, v2, v2, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 65
    :cond_0
    invoke-virtual {v0, v7}, Landroid/view/View;->setClipBounds(Landroid/graphics/Rect;)V

    .line 58
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    .line 67
    :cond_1
    return-void
.end method
