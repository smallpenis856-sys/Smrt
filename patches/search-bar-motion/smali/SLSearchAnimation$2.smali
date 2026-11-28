.class LSLSearchAnimation$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SLSearchAnimation.java"


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
    .line 55
    iput-object p1, p0, LSLSearchAnimation$2;->this$0:LSLSearchAnimation;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .prologue
    .line 57
    iget-object v0, p0, LSLSearchAnimation$2;->this$0:LSLSearchAnimation;

    invoke-static {v0}, LSLSearchAnimation;->access$200(LSLSearchAnimation;)V

    .line 58
    iget-object v0, p0, LSLSearchAnimation$2;->this$0:LSLSearchAnimation;

    invoke-static {v0}, LSLSearchAnimation;->access$300(LSLSearchAnimation;)Landroid/animation/ValueAnimator;

    move-result-object v0

    if-ne v0, p1, :cond_0

    iget-object v0, p0, LSLSearchAnimation$2;->this$0:LSLSearchAnimation;

    const/4 v1, 0x0

    invoke-static {v0, v1}, LSLSearchAnimation;->access$302(LSLSearchAnimation;Landroid/animation/ValueAnimator;)Landroid/animation/ValueAnimator;

    .line 59
    :cond_0
    return-void
.end method
