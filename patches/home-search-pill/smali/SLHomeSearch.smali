.class public final LSLHomeSearch;
.super Landroid/widget/FrameLayout;
.source "SLHomeSearch.java"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LSLHomeSearch$Magnifier;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "sl_home_search_pill_v1"


# instance fields
.field private final dock:Landroid/view/View;

.field private editMode:Z

.field private final editOverlay:Landroid/view/View;

.field private final indicator:Landroid/view/View;

.field private final root:Landroid/widget/FrameLayout;


# direct methods
.method private constructor <init>(Landroid/widget/FrameLayout;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .locals 8

    .prologue
    const/high16 v3, 0x41200000    # 10.0f

    const/high16 v4, 0x40a00000    # 5.0f

    const/4 v7, 0x0

    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 40
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, LSLHomeSearch;->root:Landroid/widget/FrameLayout;

    iput-object p2, p0, LSLHomeSearch;->dock:Landroid/view/View;

    iput-object p3, p0, LSLHomeSearch;->indicator:Landroid/view/View;

    iput-object p4, p0, LSLHomeSearch;->editOverlay:Landroid/view/View;

    .line 41
    const-string v0, "sl_home_search_pill_v1"

    invoke-virtual {p0, v0}, LSLHomeSearch;->setTag(Ljava/lang/Object;)V

    const/high16 v0, 0x42c00000    # 96.0f

    invoke-direct {p0, v0}, LSLHomeSearch;->dp(F)I

    move-result v0

    invoke-virtual {p0, v0}, LSLHomeSearch;->setMinimumWidth(I)V

    const/high16 v0, 0x42400000    # 48.0f

    invoke-direct {p0, v0}, LSLHomeSearch;->dp(F)I

    move-result v0

    invoke-virtual {p0, v0}, LSLHomeSearch;->setMinimumHeight(I)V

    .line 42
    invoke-virtual {p0, v5}, LSLHomeSearch;->setClickable(Z)V

    invoke-virtual {p0, v5}, LSLHomeSearch;->setFocusable(Z)V

    .line 43
    invoke-virtual {p0}, LSLHomeSearch;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f1306ba

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 44
    invoke-virtual {p0, v0}, LSLHomeSearch;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 45
    new-instance v1, Landroid/widget/TextView;

    invoke-virtual {p0}, LSLHomeSearch;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 46
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v0, 0x41400000    # 12.0f

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    const v0, -0xa0a0b

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 47
    const/16 v0, 0x11

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setGravity(I)V

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setSingleLine(Z)V

    sget-object v0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 48
    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    invoke-direct {p0, v3}, LSLHomeSearch;->dp(F)I

    move-result v0

    invoke-direct {p0, v4}, LSLHomeSearch;->dp(F)I

    move-result v2

    invoke-direct {p0, v3}, LSLHomeSearch;->dp(F)I

    move-result v3

    invoke-direct {p0, v4}, LSLHomeSearch;->dp(F)I

    move-result v4

    invoke-virtual {v1, v0, v2, v3, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    const/high16 v0, 0x41e00000    # 28.0f

    invoke-direct {p0, v0}, LSLHomeSearch;->dp(F)I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setMinHeight(I)V

    .line 49
    const/4 v0, 0x2

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setImportantForAccessibility(I)V

    .line 50
    new-instance v0, LSLHomeSearch$Magnifier;

    invoke-direct {v0, p0, v6}, LSLHomeSearch$Magnifier;-><init>(LSLHomeSearch;LSLHomeSearch$1;)V

    const/high16 v2, 0x41500000    # 13.0f

    invoke-direct {p0, v2}, LSLHomeSearch;->dp(F)I

    move-result v2

    invoke-virtual {v0, v7, v7, v2, v2}, LSLHomeSearch$Magnifier;->setBounds(IIII)V

    .line 51
    invoke-virtual {v1, v0, v6, v6, v6}, Landroid/widget/TextView;->setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    const/high16 v0, 0x40800000    # 4.0f

    invoke-direct {p0, v0}, LSLHomeSearch;->dp(F)I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 52
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v2, 0x664c4c4c

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v2, 0x41c00000    # 24.0f

    invoke-direct {p0, v2}, LSLHomeSearch;->dp(F)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {p0, v2}, LSLHomeSearch;->dp(F)I

    move-result v2

    invoke-static {v5, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    const v3, 0x66ffffff

    invoke-virtual {v0, v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 53
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, -0x2

    const/4 v3, -0x2

    const/16 v4, 0x11

    invoke-direct {v0, v2, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p0, v1, v0}, LSLHomeSearch;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 54
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, LSLHomeSearch;->setVisibility(I)V

    .line 55
    new-instance v0, LSLHomeSearch$1;

    invoke-direct {v0, p0}, LSLHomeSearch$1;-><init>(LSLHomeSearch;)V

    invoke-virtual {p0, v0}, LSLHomeSearch;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 63
    return-void
.end method

.method static synthetic access$100(LSLHomeSearch;)Z
    .locals 1

    .prologue
    .line 18
    iget-boolean v0, p0, LSLHomeSearch;->editMode:Z

    return v0
.end method

.method static synthetic access$200(LSLHomeSearch;)V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, LSLHomeSearch;->position()V

    return-void
.end method

.method private dp(F)I
    .locals 1

    .prologue
    .line 64
    invoke-virtual {p0}, LSLHomeSearch;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0
.end method

.method public static editVisibility(Landroid/view/View;I)V
    .locals 2

    .prologue
    .line 31
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-nez v0, :cond_1

    .line 38
    :cond_0
    :goto_0
    return-void

    .line 32
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    const-string v1, "sl_home_search_pill_v1"

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    .line 33
    instance-of v1, v0, LSLHomeSearch;

    if-eqz v1, :cond_0

    .line 34
    check-cast v0, LSLHomeSearch;

    .line 35
    if-nez p1, :cond_2

    const/4 v1, 0x1

    :goto_1
    iput-boolean v1, v0, LSLHomeSearch;->editMode:Z

    .line 36
    invoke-direct {v0}, LSLHomeSearch;->position()V

    goto :goto_0

    .line 35
    :cond_2
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public static install(Landroid/widget/FrameLayout;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .locals 4

    .prologue
    const/4 v3, -0x2

    .line 25
    const-string v0, "sl_home_search_pill_v1"

    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 29
    :goto_0
    return-void

    .line 26
    :cond_0
    new-instance v0, LSLHomeSearch;

    invoke-direct {v0, p0, p1, p2, p3}, LSLHomeSearch;-><init>(Landroid/widget/FrameLayout;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    .line 27
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v2, 0x31

    invoke-direct {v1, v3, v3, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 28
    invoke-virtual {p0, v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0
.end method

.method private position()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    .line 78
    invoke-virtual {p0}, LSLHomeSearch;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, LSLHomeSearch;->editMode:Z

    if-nez v0, :cond_0

    iget-object v0, p0, LSLHomeSearch;->dock:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    invoke-virtual {p0, v6}, LSLHomeSearch;->setVisibility(I)V

    .line 85
    :goto_0
    return-void

    .line 79
    :cond_1
    const/high16 v0, 0x42600000    # 56.0f

    invoke-direct {p0, v0}, LSLHomeSearch;->dp(F)I

    move-result v5

    .line 80
    iget-object v0, p0, LSLHomeSearch;->dock:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v1

    .line 81
    iget-object v0, p0, LSLHomeSearch;->indicator:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, LSLHomeSearch;->indicator:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    if-lez v0, :cond_2

    iget-object v0, p0, LSLHomeSearch;->indicator:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v2

    .line 82
    :goto_1
    iget-object v0, p0, LSLHomeSearch;->root:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v0

    invoke-virtual {p0}, LSLHomeSearch;->getMeasuredHeight()I

    move-result v3

    const/high16 v4, 0x40000000    # 2.0f

    invoke-direct {p0, v4}, LSLHomeSearch;->dp(F)I

    move-result v4

    invoke-static/range {v0 .. v5}, LSLPillPosition;->top(IIIIII)I

    move-result v0

    .line 83
    if-gez v0, :cond_3

    invoke-virtual {p0, v6}, LSLHomeSearch;->setVisibility(I)V

    goto :goto_0

    .line 81
    :cond_2
    const/4 v2, -0x1

    goto :goto_1

    .line 84
    :cond_3
    int-to-float v0, v0

    invoke-virtual {p0, v0}, LSLHomeSearch;->setY(F)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, LSLHomeSearch;->setVisibility(I)V

    goto :goto_0
.end method


# virtual methods
.method public getAccessibilityClassName()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 65
    const-string v0, "android.widget.Button"

    return-object v0
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .prologue
    .line 67
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 68
    iget-object v0, p0, LSLHomeSearch;->root:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iget-object v0, p0, LSLHomeSearch;->dock:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iget-object v0, p0, LSLHomeSearch;->indicator:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 69
    iget-object v0, p0, LSLHomeSearch;->editOverlay:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, LSLHomeSearch;->editMode:Z

    .line 70
    new-instance v0, LSLHomeSearch$2;

    invoke-direct {v0, p0}, LSLHomeSearch$2;-><init>(LSLHomeSearch;)V

    invoke-virtual {p0, v0}, LSLHomeSearch;->post(Ljava/lang/Runnable;)Z

    .line 71
    return-void

    .line 69
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, LSLHomeSearch;->root:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iget-object v0, p0, LSLHomeSearch;->dock:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iget-object v0, p0, LSLHomeSearch;->indicator:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 74
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 75
    return-void
.end method

.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    .prologue
    .line 76
    invoke-direct {p0}, LSLHomeSearch;->position()V

    return-void
.end method
