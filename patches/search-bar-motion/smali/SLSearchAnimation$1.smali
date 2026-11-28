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
    .line 50
    iput-object p1, p0, LSLSearchAnimation$1;->this$0:LSLSearchAnimation;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

    .prologue
    .line 52
    iget-object v0, p0, LSLSearchAnimation$1;->this$0:LSLSearchAnimation;

    invoke-static {v0}, LSLSearchAnimation;->access$000(LSLSearchAnimation;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, LSLSearchAnimation$1;->this$0:LSLSearchAnimation;

    invoke-static {v0}, LSLSearchAnimation;->access$000(LSLSearchAnimation;)Landroid/view/View;

    move-result-object v1

    iget-object v0, p0, LSLSearchAnimation$1;->this$0:LSLSearchAnimation;

    invoke-static {v0}, LSLSearchAnimation;->access$100(LSLSearchAnimation;)F

    move-result v2

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    mul-float/2addr v0, v2

    invoke-virtual {v1, v0}, Landroid/view/View;->setScaleX(F)V

    .line 53
    :cond_0
    return-void
.end method
