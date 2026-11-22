.class public Lginlemon/flower/glass/SLDrawerSearchLayout;
.super Landroid/widget/FrameLayout;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;

.field private homeSearch:Lginlemon/flower/widgets/searchbar/SearchBarWidget;

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method protected onFinishInflate()V
    .locals 2

    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lginlemon/flower/widgets/searchbar/SearchBarWidget;

    # A reserved ID isolates drawer preferences from editable home widgets.
    const/16 v1, -0x113

    invoke-virtual {v0, v1}, Lginlemon/flower/widgets/searchbar/SearchBarWidget;->v(I)V

    invoke-virtual {v0}, Lginlemon/flower/widgetUtils/compose/ViewWidgetComposableLayout;->t()V

    # Keep the drawer's existing search action, not widget editing/navigation.
    new-instance v1, Lginlemon/flower/glass/SLSearchClick;

    invoke-direct {v1}, Lginlemon/flower/glass/SLSearchClick;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

# Observe only while attached; the source belongs to HomeScreen's lifecycle.
.method protected onAttachedToWindow()V
    .locals 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V
    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1
    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
    const/4 v0, 0x0
    iput-object v0, p0, Lginlemon/flower/glass/SLDrawerSearchLayout;->homeSearch:Lginlemon/flower/widgets/searchbar/SearchBarWidget;
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V
    return-void
.end method

# Do not mistake our own child for the home widget.
# shortcut: first initialized home search is used; add selection if multiple bars need distinct styles.
.method private findHomeSearch(Landroid/view/View;)Lginlemon/flower/widgets/searchbar/SearchBarWidget;
    .locals 3
    if-eq p1, p0, :missing
    instance-of v0, p1, Lginlemon/flower/widgets/searchbar/SearchBarWidget;
    if-eqz v0, :group
    check-cast p1, Lginlemon/flower/widgets/searchbar/SearchBarWidget;
    iget-object v0, p1, Lginlemon/flower/widgetUtils/compose/ViewWidgetComposableLayout;->D:Landroidx/lifecycle/ViewModel;
    if-eqz v0, :missing
    return-object p1
    :group
    instance-of v0, p1, Landroid/view/ViewGroup;
    if-eqz v0, :missing
    check-cast p1, Landroid/view/ViewGroup;
    const/4 v0, 0x0
    :next
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v1
    if-ge v0, v1, :missing
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v1
    invoke-direct {p0, v1}, Lginlemon/flower/glass/SLDrawerSearchLayout;->findHomeSearch(Landroid/view/View;)Lginlemon/flower/widgets/searchbar/SearchBarWidget;
    move-result-object v2
    if-eqz v2, :continue
    return-object v2
    :continue
    add-int/lit8 v0, v0, 0x1
    goto :next
    :missing
    const/4 v0, 0x0
    return-object v0
.end method

.method public onPreDraw()Z
    .locals 7
    invoke-virtual {p0}, Landroid/view/View;->isShown()Z
    move-result v0
    if-eqz v0, :done
    iget-object v0, p0, Lginlemon/flower/glass/SLDrawerSearchLayout;->homeSearch:Lginlemon/flower/widgets/searchbar/SearchBarWidget;
    if-eqz v0, :find
    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z
    move-result v1
    if-nez v1, :sync
    :find
    invoke-virtual {p0}, Landroid/view/View;->getRootView()Landroid/view/View;
    move-result-object v0
    invoke-direct {p0, v0}, Lginlemon/flower/glass/SLDrawerSearchLayout;->findHomeSearch(Landroid/view/View;)Lginlemon/flower/widgets/searchbar/SearchBarWidget;
    move-result-object v0
    iput-object v0, p0, Lginlemon/flower/glass/SLDrawerSearchLayout;->homeSearch:Lginlemon/flower/widgets/searchbar/SearchBarWidget;
    if-eqz v0, :done
    :sync
    const/4 v1, 0x0
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v1
    check-cast v1, Lginlemon/flower/widgets/searchbar/SearchBarWidget;
    const/4 v4, 0x0
    iget-object v2, v0, Lginlemon/flower/widgetUtils/compose/ViewWidgetComposableLayout;->D:Landroidx/lifecycle/ViewModel;
    iget-object v3, v1, Lginlemon/flower/widgetUtils/compose/ViewWidgetComposableLayout;->D:Landroidx/lifecycle/ViewModel;
    if-eq v2, v3, :same_0
    iput-object v2, v1, Lginlemon/flower/widgetUtils/compose/ViewWidgetComposableLayout;->D:Landroidx/lifecycle/ViewModel;
    const/4 v4, 0x1
    :same_0
    iget-object v2, v0, Lginlemon/flower/widgetUtils/compose/ViewWidgetComposableLayout;->H:Luec;
    iget-object v3, v1, Lginlemon/flower/widgetUtils/compose/ViewWidgetComposableLayout;->H:Luec;
    if-eq v2, v3, :same_1
    iput-object v2, v1, Lginlemon/flower/widgetUtils/compose/ViewWidgetComposableLayout;->H:Luec;
    const/4 v4, 0x1
    :same_1
    iget-object v2, v0, Lginlemon/flower/widgetUtils/compose/ViewWidgetComposableLayout;->J:Lp7b;
    iget-object v3, v1, Lginlemon/flower/widgetUtils/compose/ViewWidgetComposableLayout;->J:Lp7b;
    if-eq v2, v3, :same_2
    iput-object v2, v1, Lginlemon/flower/widgetUtils/compose/ViewWidgetComposableLayout;->J:Lp7b;
    const/4 v4, 0x1
    :same_2
    iget-object v5, v0, Lginlemon/flower/widgetUtils/compose/ViewWidgetComposableLayout;->F:Lui9;
    iget-object v6, v1, Lginlemon/flower/widgetUtils/compose/ViewWidgetComposableLayout;->F:Lui9;
    iget v2, v5, Lui9;->a:F
    iget v3, v6, Lui9;->a:F
    cmpl-float v3, v2, v3
    if-eqz v3, :same_strength
    iput v2, v6, Lui9;->a:F
    const/4 v4, 0x1
    :same_strength
    iget-boolean v2, v5, Lui9;->b:Z
    iget-boolean v3, v6, Lui9;->b:Z
    if-eq v2, v3, :same_enabled
    iput-boolean v2, v6, Lui9;->b:Z
    const/4 v4, 0x1
    :same_enabled
    if-eqz v4, :done
    # Native Compose still samples at the drawer child's own coordinates.
    invoke-virtual {v1}, Lginlemon/flower/widgetUtils/compose/ViewWidgetComposableLayout;->t()V
    :done
    const/4 v0, 0x1
    return v0
.end method
