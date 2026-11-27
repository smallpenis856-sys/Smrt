.class public final LSLGlassCard;
.super Landroid/widget/FrameLayout;
.source "SLGlassCard.java"


# instance fields
.field private glass:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .prologue
    .line 8
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .registers 7

    .prologue
    const/high16 v3, 0x40000000    # 2.0f

    .line 15
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 16
    iget-object v0, p0, LSLGlassCard;->glass:Landroid/view/View;

    if-eqz v0, :cond_1e

    .line 17
    iget-object v0, p0, LSLGlassCard;->glass:Landroid/view/View;

    invoke-virtual {p0}, LSLGlassCard;->getMeasuredWidth()I

    move-result v1

    invoke-static {v1, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 18
    invoke-virtual {p0}, LSLGlassCard;->getMeasuredHeight()I

    move-result v2

    invoke-static {v2, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 17
    invoke-virtual {v0, v1, v2}, Landroid/view/View;->measure(II)V

    .line 20
    :cond_1e
    return-void
.end method

.method public setGlass(Landroid/view/View;)V
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 11
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, p1, v0}, LSLGlassCard;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 12
    iput-object p1, p0, LSLGlassCard;->glass:Landroid/view/View;

    .line 13
    return-void
.end method
