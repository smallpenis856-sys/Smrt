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
    .line 62
    iput-object p1, p0, LSLSearchAnimation$1;->this$0:LSLSearchAnimation;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 6

    .prologue
    .line 64
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v2

    .line 65
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v0, p0, LSLSearchAnimation$1;->this$0:LSLSearchAnimation;

    invoke-static {v0}, LSLSearchAnimation;->access$000(LSLSearchAnimation;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_0

    .line 66
    iget-object v0, p0, LSLSearchAnimation$1;->this$0:LSLSearchAnimation;

    invoke-static {v0}, LSLSearchAnimation;->access$000(LSLSearchAnimation;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iget-object v3, p0, LSLSearchAnimation$1;->this$0:LSLSearchAnimation;

    invoke-static {v3}, LSLSearchAnimation;->access$100(LSLSearchAnimation;)[F

    move-result-object v3

    aget v3, v3, v1

    mul-float/2addr v3, v2

    invoke-virtual {v0, v3}, Landroid/view/View;->setScaleX(F)V

    .line 67
    iget-object v0, p0, LSLSearchAnimation$1;->this$0:LSLSearchAnimation;

    invoke-static {v0}, LSLSearchAnimation;->access$000(LSLSearchAnimation;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iget-object v3, p0, LSLSearchAnimation$1;->this$0:LSLSearchAnimation;

    invoke-static {v3}, LSLSearchAnimation;->access$200(LSLSearchAnimation;)[F

    move-result-object v3

    aget v3, v3, v1

    iget-object v4, p0, LSLSearchAnimation$1;->this$0:LSLSearchAnimation;

    invoke-static {v4}, LSLSearchAnimation;->access$300(LSLSearchAnimation;)[F

    move-result-object v4

    aget v4, v4, v1

    const/high16 v5, 0x3f800000    # 1.0f

    sub-float/2addr v5, v2

    mul-float/2addr v4, v5

    add-float/2addr v3, v4

    invoke-virtual {v0, v3}, Landroid/view/View;->setTranslationX(F)V

    .line 65
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    .line 69
    :cond_0
    return-void
.end method
