.class public Lginlemon/flower/glass/SLDrawerSearchReturn;
.super Ljava/lang/Object;

.method public static restore(Lginlemon/flower/searchPanel/SearchPanel;)Z
    .locals 7
    iget-object v2, p0, Lginlemon/flower/searchPanel/SearchPanel;->slReturnPanel:Lj48;
    const/4 v4, 0x0
    if-eqz v2, :not_handled
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static {v0}, Lfn0;->x(Landroid/content/Context;)Lginlemon/flower/HomeScreen;
    move-result-object v0
    if-eqz v0, :not_handled
    invoke-virtual {v0}, Lginlemon/flower/HomeScreen;->y()Lf58;
    move-result-object v1
    iget v3, v2, Lj48;->a:I
    invoke-virtual {v1, v3}, Lf58;->k(I)Lj48;
    move-result-object v3
    if-ne v2, v3, :not_handled
    const/4 v0, 0x0
    iput-object v0, p0, Lginlemon/flower/searchPanel/SearchPanel;->slReturnPanel:Lj48;
    invoke-virtual {p0}, Lginlemon/flower/searchPanel/SearchPanel;->v()V
    # Restore both axes in one frame; retain the existing drawer view/scroll state.
    sget-object v3, Lo48;->INSTANCE:Lo48;
    const/high16 v5, 0x3f800000
    invoke-virtual {v1, v3, v4, v5, v0}, Lf58;->r(Lw48;ZFLcs4;)Z
    const/4 v5, 0x0
    invoke-virtual {v1, v2, v4, v5, v0}, Lf58;->q(Lj48;ZFLcs4;)V
    const/4 v0, 0x1
    return v0
    :not_handled
    const/4 v0, 0x0
    return v0
.end method
