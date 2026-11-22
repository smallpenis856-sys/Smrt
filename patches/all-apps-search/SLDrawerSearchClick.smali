.class public Lginlemon/flower/glass/SLDrawerSearchClick;
.super Ljava/lang/Object;
.implements Landroid/view/View$OnClickListener;

.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 7
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static {v0}, Lfn0;->x(Landroid/content/Context;)Lginlemon/flower/HomeScreen;
    move-result-object v0
    if-eqz v0, :done
    invoke-virtual {v0}, Lginlemon/flower/HomeScreen;->y()Lf58;
    move-result-object v1
    iget-object v2, v1, Lf58;->I:Landroid/animation/ValueAnimator;
    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->isRunning()Z
    move-result v2
    if-nez v2, :done
    const/16 v2, 0x28
    invoke-virtual {v1, v2}, Lf58;->k(I)Lj48;
    move-result-object v2
    if-eqz v2, :missing
    iget-object v6, v2, Lj48;->b:Landroid/view/ViewGroup;
    instance-of v3, v6, Lginlemon/flower/searchPanel/SearchPanel;
    if-eqz v3, :done

    # Normalize axes and show search synchronously, before Android draws a frame.
    # HomeScreen.H/G use f58.z, which animates search AFTER resetting to home.
    sget-object v3, Lo48;->INSTANCE:Lo48;
    const/4 v4, 0x0
    const/high16 v5, 0x3f800000
    const/4 v0, 0x0
    invoke-virtual {v1, v3, v4, v5, v0}, Lf58;->r(Lw48;ZFLcs4;)Z
    const/4 v5, 0x0
    invoke-virtual {v1, v2, v4, v5, v0}, Lf58;->q(Lj48;ZFLcs4;)V
    check-cast v6, Lginlemon/flower/searchPanel/SearchPanel;
    invoke-virtual {v6}, Lginlemon/flower/searchPanel/SearchPanel;->H()V
    return-void

    :missing
    # Preserve the launcher's existing disabled/missing-search handling.
    const/16 v2, 0x28
    invoke-virtual {v0, v2}, Lginlemon/flower/HomeScreen;->o(I)V
    :done
    return-void
.end method
