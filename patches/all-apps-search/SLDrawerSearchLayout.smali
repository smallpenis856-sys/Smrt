.class public Lginlemon/flower/glass/SLDrawerSearchLayout;
.super Landroid/widget/FrameLayout;

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
