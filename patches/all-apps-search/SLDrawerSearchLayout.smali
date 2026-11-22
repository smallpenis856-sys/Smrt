.class public Lginlemon/flower/glass/SLDrawerSearchLayout;
.super Landroid/widget/FrameLayout;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;

.field private static homeState:Landroidx/lifecycle/ViewModel;
.field private static homeAppearance:Luec;
.field private static homeRenderer:Lp7b;
.field private static homeStrength:F
.field private static homeGlassEnabled:Z

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

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v1
    const/4 v0, 0x1
    if-ne v1, v0, :drawer_foreground
    return-void
    :drawer_foreground
    const/4 v0, 0x0
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v0

    # Drawer-only atomic navigation avoids the intermediate home animation.
    new-instance v1, Lginlemon/flower/glass/SLDrawerSearchClick;

    invoke-direct {v1}, Lginlemon/flower/glass/SLDrawerSearchClick;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 v0, 0x1
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v0
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    check-cast v0, Landroid/view/ViewGroup;
    const/4 v1, 0x2
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v0
    new-instance v1, Lginlemon/flower/glass/SLDrawerVoiceClick;
    invoke-direct {v1}, Lginlemon/flower/glass/SLDrawerVoiceClick;-><init>()V
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
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V
    return-void
.end method

# Called by the HOME renderer, including when its view is offscreen/detached.
# shortcut: last rendered home bar wins if several home search widgets exist.
.method public static captureHome(Lginlemon/flower/widgets/searchbar/SearchBarWidget;FLp7b;Luec;)V
    .locals 2
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;
    move-result-object v0
    const-string v1, "all_apps_search"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :done
    iget-object v0, p0, Lginlemon/flower/widgetUtils/compose/ViewWidgetComposableLayout;->D:Landroidx/lifecycle/ViewModel;
    if-eqz v0, :done
    sput-object v0, Lginlemon/flower/glass/SLDrawerSearchLayout;->homeState:Landroidx/lifecycle/ViewModel;
    sput-object p2, Lginlemon/flower/glass/SLDrawerSearchLayout;->homeRenderer:Lp7b;
    sput-object p3, Lginlemon/flower/glass/SLDrawerSearchLayout;->homeAppearance:Luec;
    iget-object v0, p0, Lginlemon/flower/widgetUtils/compose/ViewWidgetComposableLayout;->F:Lui9;
    iget v1, v0, Lui9;->a:F
    sput v1, Lginlemon/flower/glass/SLDrawerSearchLayout;->homeStrength:F
    iget-boolean v1, v0, Lui9;->b:Z
    sput-boolean v1, Lginlemon/flower/glass/SLDrawerSearchLayout;->homeGlassEnabled:Z
    :done
    return-void
.end method

.method public onPreDraw()Z
    .locals 6
    invoke-virtual {p0}, Landroid/view/View;->isShown()Z
    move-result v0
    if-eqz v0, :done
    sget-object v0, Lginlemon/flower/glass/SLDrawerSearchLayout;->homeState:Landroidx/lifecycle/ViewModel;
    if-eqz v0, :done
    const/4 v1, 0x0
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v1
    check-cast v1, Lginlemon/flower/widgets/searchbar/SearchBarWidget;
    const/4 v4, 0x0
    sget-object v2, Lginlemon/flower/glass/SLDrawerSearchLayout;->homeState:Landroidx/lifecycle/ViewModel;
    iget-object v3, v1, Lginlemon/flower/widgetUtils/compose/ViewWidgetComposableLayout;->D:Landroidx/lifecycle/ViewModel;
    if-eq v2, v3, :same_0
    iput-object v2, v1, Lginlemon/flower/widgetUtils/compose/ViewWidgetComposableLayout;->D:Landroidx/lifecycle/ViewModel;
    const/4 v4, 0x1
    :same_0
    sget-object v2, Lginlemon/flower/glass/SLDrawerSearchLayout;->homeAppearance:Luec;
    iget-object v3, v1, Lginlemon/flower/widgetUtils/compose/ViewWidgetComposableLayout;->H:Luec;
    if-eq v2, v3, :same_1
    iput-object v2, v1, Lginlemon/flower/widgetUtils/compose/ViewWidgetComposableLayout;->H:Luec;
    const/4 v4, 0x1
    :same_1
    sget-object v2, Lginlemon/flower/glass/SLDrawerSearchLayout;->homeRenderer:Lp7b;
    iget-object v3, v1, Lginlemon/flower/widgetUtils/compose/ViewWidgetComposableLayout;->J:Lp7b;
    if-eq v2, v3, :same_2
    iput-object v2, v1, Lginlemon/flower/widgetUtils/compose/ViewWidgetComposableLayout;->J:Lp7b;
    const/4 v4, 0x1
    :same_2
    iget-object v5, v1, Lginlemon/flower/widgetUtils/compose/ViewWidgetComposableLayout;->F:Lui9;
    sget v2, Lginlemon/flower/glass/SLDrawerSearchLayout;->homeStrength:F
    iget v3, v5, Lui9;->a:F
    cmpl-float v3, v2, v3
    if-eqz v3, :same_strength
    iput v2, v5, Lui9;->a:F
    const/4 v4, 0x1
    :same_strength
    sget-boolean v2, Lginlemon/flower/glass/SLDrawerSearchLayout;->homeGlassEnabled:Z
    iget-boolean v3, v5, Lui9;->b:Z
    if-eq v2, v3, :same_enabled
    iput-boolean v2, v5, Lui9;->b:Z
    const/4 v4, 0x1
    :same_enabled
    if-eqz v4, :done
    invoke-virtual {v1}, Lginlemon/flower/widgetUtils/compose/ViewWidgetComposableLayout;->t()V
    :done
    const/4 v0, 0x1
    return v0
.end method
