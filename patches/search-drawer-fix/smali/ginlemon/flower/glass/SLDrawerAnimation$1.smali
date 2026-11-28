.class Lginlemon/flower/glass/SLDrawerAnimation$1;
.super Ljava/lang/Object;
.source "SLDrawerAnimation.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lginlemon/flower/glass/SLDrawerAnimation;->play()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lginlemon/flower/glass/SLDrawerAnimation;


# direct methods
.method constructor <init>(Lginlemon/flower/glass/SLDrawerAnimation;)V
    .locals 0

    .prologue
    .line 37
    iput-object p1, p0, Lginlemon/flower/glass/SLDrawerAnimation$1;->this$0:Lginlemon/flower/glass/SLDrawerAnimation;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 39
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iget-object v1, p0, Lginlemon/flower/glass/SLDrawerAnimation$1;->this$0:Lginlemon/flower/glass/SLDrawerAnimation;

    invoke-static {v1}, Lginlemon/flower/glass/SLDrawerAnimation;->access$000(Lginlemon/flower/glass/SLDrawerAnimation;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    .line 40
    int-to-float v2, v1

    const/high16 v3, 0x3f800000    # 1.0f

    sub-float v0, v3, v0

    mul-float/2addr v0, v2

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iget-object v2, p0, Lginlemon/flower/glass/SLDrawerAnimation$1;->this$0:Lginlemon/flower/glass/SLDrawerAnimation;

    invoke-static {v2}, Lginlemon/flower/glass/SLDrawerAnimation;->access$100(Lginlemon/flower/glass/SLDrawerAnimation;)Landroid/graphics/Rect;

    move-result-object v2

    sub-int/2addr v1, v0

    iget-object v3, p0, Lginlemon/flower/glass/SLDrawerAnimation$1;->this$0:Lginlemon/flower/glass/SLDrawerAnimation;

    invoke-static {v3}, Lginlemon/flower/glass/SLDrawerAnimation;->access$000(Lginlemon/flower/glass/SLDrawerAnimation;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    invoke-virtual {v2, v0, v4, v1, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 41
    iget-object v0, p0, Lginlemon/flower/glass/SLDrawerAnimation$1;->this$0:Lginlemon/flower/glass/SLDrawerAnimation;

    invoke-static {v0}, Lginlemon/flower/glass/SLDrawerAnimation;->access$200(Lginlemon/flower/glass/SLDrawerAnimation;)Landroid/graphics/Rect;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lginlemon/flower/glass/SLDrawerAnimation$1;->this$0:Lginlemon/flower/glass/SLDrawerAnimation;

    invoke-static {v0}, Lginlemon/flower/glass/SLDrawerAnimation;->access$100(Lginlemon/flower/glass/SLDrawerAnimation;)Landroid/graphics/Rect;

    move-result-object v0

    iget-object v1, p0, Lginlemon/flower/glass/SLDrawerAnimation$1;->this$0:Lginlemon/flower/glass/SLDrawerAnimation;

    invoke-static {v1}, Lginlemon/flower/glass/SLDrawerAnimation;->access$200(Lginlemon/flower/glass/SLDrawerAnimation;)Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Rect;->intersect(Landroid/graphics/Rect;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lginlemon/flower/glass/SLDrawerAnimation$1;->this$0:Lginlemon/flower/glass/SLDrawerAnimation;

    invoke-static {v0}, Lginlemon/flower/glass/SLDrawerAnimation;->access$100(Lginlemon/flower/glass/SLDrawerAnimation;)Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0, v4, v4, v4, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 42
    :cond_0
    iget-object v0, p0, Lginlemon/flower/glass/SLDrawerAnimation$1;->this$0:Lginlemon/flower/glass/SLDrawerAnimation;

    invoke-static {v0}, Lginlemon/flower/glass/SLDrawerAnimation;->access$000(Lginlemon/flower/glass/SLDrawerAnimation;)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lginlemon/flower/glass/SLDrawerAnimation$1;->this$0:Lginlemon/flower/glass/SLDrawerAnimation;

    invoke-static {v1}, Lginlemon/flower/glass/SLDrawerAnimation;->access$100(Lginlemon/flower/glass/SLDrawerAnimation;)Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setClipBounds(Landroid/graphics/Rect;)V

    .line 43
    return-void
.end method
