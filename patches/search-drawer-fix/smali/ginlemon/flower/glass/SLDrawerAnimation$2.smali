.class Lginlemon/flower/glass/SLDrawerAnimation$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SLDrawerAnimation.java"


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
    .line 45
    iput-object p1, p0, Lginlemon/flower/glass/SLDrawerAnimation$2;->this$0:Lginlemon/flower/glass/SLDrawerAnimation;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 47
    iget-object v0, p0, Lginlemon/flower/glass/SLDrawerAnimation$2;->this$0:Lginlemon/flower/glass/SLDrawerAnimation;

    invoke-static {v0}, Lginlemon/flower/glass/SLDrawerAnimation;->access$000(Lginlemon/flower/glass/SLDrawerAnimation;)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lginlemon/flower/glass/SLDrawerAnimation$2;->this$0:Lginlemon/flower/glass/SLDrawerAnimation;

    invoke-static {v1}, Lginlemon/flower/glass/SLDrawerAnimation;->access$200(Lginlemon/flower/glass/SLDrawerAnimation;)Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setClipBounds(Landroid/graphics/Rect;)V

    iget-object v0, p0, Lginlemon/flower/glass/SLDrawerAnimation$2;->this$0:Lginlemon/flower/glass/SLDrawerAnimation;

    invoke-static {v0}, Lginlemon/flower/glass/SLDrawerAnimation;->access$000(Lginlemon/flower/glass/SLDrawerAnimation;)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lginlemon/flower/glass/SLDrawerAnimation$2;->this$0:Lginlemon/flower/glass/SLDrawerAnimation;

    invoke-virtual {v0, v1}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 48
    invoke-static {}, Lginlemon/flower/glass/SLDrawerAnimation;->access$300()Lginlemon/flower/glass/SLDrawerAnimation;

    move-result-object v0

    iget-object v1, p0, Lginlemon/flower/glass/SLDrawerAnimation$2;->this$0:Lginlemon/flower/glass/SLDrawerAnimation;

    if-ne v0, v1, :cond_0

    invoke-static {v2}, Lginlemon/flower/glass/SLDrawerAnimation;->access$302(Lginlemon/flower/glass/SLDrawerAnimation;)Lginlemon/flower/glass/SLDrawerAnimation;

    .line 49
    :cond_0
    iget-object v0, p0, Lginlemon/flower/glass/SLDrawerAnimation$2;->this$0:Lginlemon/flower/glass/SLDrawerAnimation;

    invoke-static {v0, v2}, Lginlemon/flower/glass/SLDrawerAnimation;->access$402(Lginlemon/flower/glass/SLDrawerAnimation;Landroid/animation/ValueAnimator;)Landroid/animation/ValueAnimator;

    .line 50
    iget-object v0, p0, Lginlemon/flower/glass/SLDrawerAnimation$2;->this$0:Lginlemon/flower/glass/SLDrawerAnimation;

    invoke-static {v0}, Lginlemon/flower/glass/SLDrawerAnimation;->access$500(Lginlemon/flower/glass/SLDrawerAnimation;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lginlemon/flower/glass/SLDrawerAnimation$2;->this$0:Lginlemon/flower/glass/SLDrawerAnimation;

    invoke-static {v0}, Lginlemon/flower/glass/SLDrawerAnimation;->access$000(Lginlemon/flower/glass/SLDrawerAnimation;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lginlemon/flower/glass/SLDrawerAnimation$2;->this$0:Lginlemon/flower/glass/SLDrawerAnimation;

    invoke-static {v0}, Lginlemon/flower/glass/SLDrawerAnimation;->access$000(Lginlemon/flower/glass/SLDrawerAnimation;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lginlemon/flower/glass/SLDrawerAnimation$2;->this$0:Lginlemon/flower/glass/SLDrawerAnimation;

    invoke-static {v0}, Lginlemon/flower/glass/SLDrawerAnimation;->access$000(Lginlemon/flower/glass/SLDrawerAnimation;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->hasWindowFocus()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lginlemon/flower/glass/SLDrawerAnimation$2;->this$0:Lginlemon/flower/glass/SLDrawerAnimation;

    .line 51
    invoke-static {v0}, Lginlemon/flower/glass/SLDrawerAnimation;->access$000(Lginlemon/flower/glass/SLDrawerAnimation;)Landroid/view/View;

    move-result-object v0

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lginlemon/flower/glass/SLDrawerAnimation$2;->this$0:Lginlemon/flower/glass/SLDrawerAnimation;

    invoke-static {v0}, Lginlemon/flower/glass/SLDrawerAnimation;->access$700(Lginlemon/flower/glass/SLDrawerAnimation;)Lginlemon/flower/glass/SLDrawerSearchClick;

    move-result-object v0

    iget-object v1, p0, Lginlemon/flower/glass/SLDrawerAnimation$2;->this$0:Lginlemon/flower/glass/SLDrawerAnimation;

    invoke-static {v1}, Lginlemon/flower/glass/SLDrawerAnimation;->access$600(Lginlemon/flower/glass/SLDrawerAnimation;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lginlemon/flower/glass/SLDrawerSearchClick;->open(Landroid/view/View;)V

    .line 52
    :cond_1
    return-void
.end method
