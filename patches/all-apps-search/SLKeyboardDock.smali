.class public final Lginlemon/flower/glass/SLKeyboardDock;
.super Ljava/lang/Object;
.source "SLKeyboardDock.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lginlemon/flower/glass/SLKeyboardDock$Api30;
    }
.end annotation


# instance fields
.field private final container:Landroid/view/ViewGroup;

.field private final position:[I

.field private previousBottom:I

.field private previousMode:I

.field private started:Z

.field private final visible:Landroid/graphics/Rect;

.field private window:Landroid/view/Window;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .registers 3

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lginlemon/flower/glass/SLKeyboardDock;->visible:Landroid/graphics/Rect;

    .line 19
    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lginlemon/flower/glass/SLKeyboardDock;->position:[I

    .line 25
    iput-object p1, p0, Lginlemon/flower/glass/SLKeyboardDock;->container:Landroid/view/ViewGroup;

    .line 26
    return-void
.end method

.method static bottomOverlap(III)I
    .registers 11

    .prologue
    .line 78
    const/4 v0, 0x0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result v0

    int-to-long v0, v0

    const-wide/16 v2, 0x0

    int-to-long v4, p0

    int-to-long v6, p1

    add-long/2addr v4, v6

    int-to-long v6, p2

    sub-long/2addr v4, v6

    .line 79
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    .line 78
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method


# virtual methods
.method public onGlobalLayout()V
    .registers 6

    .prologue
    .line 61
    iget-boolean v0, p0, Lginlemon/flower/glass/SLKeyboardDock;->started:Z

    if-eqz v0, :cond_14

    iget-object v0, p0, Lginlemon/flower/glass/SLKeyboardDock;->container:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_14

    iget-object v0, p0, Lginlemon/flower/glass/SLKeyboardDock;->container:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->isShown()Z

    move-result v0

    if-nez v0, :cond_15

    .line 74
    :cond_14
    :goto_14
    return-void

    .line 62
    :cond_15
    iget-object v0, p0, Lginlemon/flower/glass/SLKeyboardDock;->container:Landroid/view/ViewGroup;

    iget-object v1, p0, Lginlemon/flower/glass/SLKeyboardDock;->visible:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 63
    iget-object v0, p0, Lginlemon/flower/glass/SLKeyboardDock;->visible:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 64
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1e

    if-lt v1, v2, :cond_2c

    .line 65
    iget-object v1, p0, Lginlemon/flower/glass/SLKeyboardDock;->container:Landroid/view/ViewGroup;

    invoke-static {v1, v0}, Lginlemon/flower/glass/SLKeyboardDock$Api30;->visibleBottom(Landroid/view/View;I)I

    move-result v0

    .line 66
    :cond_2c
    if-lez v0, :cond_14

    .line 67
    iget-object v1, p0, Lginlemon/flower/glass/SLKeyboardDock;->container:Landroid/view/ViewGroup;

    iget-object v2, p0, Lginlemon/flower/glass/SLKeyboardDock;->position:[I

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getLocationOnScreen([I)V

    .line 68
    iget v1, p0, Lginlemon/flower/glass/SLKeyboardDock;->previousBottom:I

    iget-object v2, p0, Lginlemon/flower/glass/SLKeyboardDock;->position:[I

    const/4 v3, 0x1

    aget v2, v2, v3

    iget-object v3, p0, Lginlemon/flower/glass/SLKeyboardDock;->container:Landroid/view/ViewGroup;

    .line 69
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getHeight()I

    move-result v3

    invoke-static {v2, v3, v0}, Lginlemon/flower/glass/SLKeyboardDock;->bottomOverlap(III)I

    move-result v0

    .line 68
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 70
    iget-object v1, p0, Lginlemon/flower/glass/SLKeyboardDock;->container:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v1

    if-eq v0, v1, :cond_14

    .line 71
    iget-object v1, p0, Lginlemon/flower/glass/SLKeyboardDock;->container:Landroid/view/ViewGroup;

    iget-object v2, p0, Lginlemon/flower/glass/SLKeyboardDock;->container:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v2

    iget-object v3, p0, Lginlemon/flower/glass/SLKeyboardDock;->container:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v3

    iget-object v4, p0, Lginlemon/flower/glass/SLKeyboardDock;->container:Landroid/view/ViewGroup;

    .line 72
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v4

    .line 71
    invoke-virtual {v1, v2, v3, v4, v0}, Landroid/view/ViewGroup;->setPadding(IIII)V

    goto :goto_14
.end method

.method public start()V
    .registers 3

    .prologue
    .line 29
    iget-boolean v0, p0, Lginlemon/flower/glass/SLKeyboardDock;->started:Z

    if-eqz v0, :cond_5

    .line 47
    :cond_4
    :goto_4
    return-void

    .line 30
    :cond_5
    iget-object v0, p0, Lginlemon/flower/glass/SLKeyboardDock;->container:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 31
    :goto_b
    instance-of v0, v1, Landroid/app/Activity;

    if-nez v0, :cond_1e

    instance-of v0, v1, Landroid/content/ContextWrapper;

    if-eqz v0, :cond_1e

    move-object v0, v1

    .line 32
    check-cast v0, Landroid/content/ContextWrapper;

    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    .line 33
    if-eq v0, v1, :cond_4

    move-object v1, v0

    .line 35
    goto :goto_b

    .line 36
    :cond_1e
    instance-of v0, v1, Landroid/app/Activity;

    if-eqz v0, :cond_4

    .line 37
    check-cast v1, Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    iput-object v0, p0, Lginlemon/flower/glass/SLKeyboardDock;->window:Landroid/view/Window;

    .line 38
    iget-object v0, p0, Lginlemon/flower/glass/SLKeyboardDock;->window:Landroid/view/Window;

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->softInputMode:I

    iput v0, p0, Lginlemon/flower/glass/SLKeyboardDock;->previousMode:I

    .line 39
    iget-object v0, p0, Lginlemon/flower/glass/SLKeyboardDock;->container:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v0

    iput v0, p0, Lginlemon/flower/glass/SLKeyboardDock;->previousBottom:I

    .line 40
    const/4 v0, 0x1

    iput-boolean v0, p0, Lginlemon/flower/glass/SLKeyboardDock;->started:Z

    .line 42
    iget-object v0, p0, Lginlemon/flower/glass/SLKeyboardDock;->window:Landroid/view/Window;

    iget v1, p0, Lginlemon/flower/glass/SLKeyboardDock;->previousMode:I

    and-int/lit16 v1, v1, -0xf1

    or-int/lit8 v1, v1, 0x10

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 44
    iget-object v0, p0, Lginlemon/flower/glass/SLKeyboardDock;->container:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 45
    iget-object v0, p0, Lginlemon/flower/glass/SLKeyboardDock;->container:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->requestApplyInsets()V

    .line 46
    invoke-virtual {p0}, Lginlemon/flower/glass/SLKeyboardDock;->onGlobalLayout()V

    goto :goto_4
.end method

.method public stop()V
    .registers 6

    .prologue
    .line 50
    iget-boolean v0, p0, Lginlemon/flower/glass/SLKeyboardDock;->started:Z

    if-nez v0, :cond_5

    .line 58
    :goto_4
    return-void

    .line 51
    :cond_5
    const/4 v0, 0x0

    iput-boolean v0, p0, Lginlemon/flower/glass/SLKeyboardDock;->started:Z

    .line 52
    iget-object v0, p0, Lginlemon/flower/glass/SLKeyboardDock;->container:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 53
    iget-object v0, p0, Lginlemon/flower/glass/SLKeyboardDock;->container:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 54
    :cond_1d
    iget-object v0, p0, Lginlemon/flower/glass/SLKeyboardDock;->window:Landroid/view/Window;

    iget v1, p0, Lginlemon/flower/glass/SLKeyboardDock;->previousMode:I

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 55
    const/4 v0, 0x0

    iput-object v0, p0, Lginlemon/flower/glass/SLKeyboardDock;->window:Landroid/view/Window;

    .line 56
    iget-object v0, p0, Lginlemon/flower/glass/SLKeyboardDock;->container:Landroid/view/ViewGroup;

    iget-object v1, p0, Lginlemon/flower/glass/SLKeyboardDock;->container:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v1

    iget-object v2, p0, Lginlemon/flower/glass/SLKeyboardDock;->container:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v2

    iget-object v3, p0, Lginlemon/flower/glass/SLKeyboardDock;->container:Landroid/view/ViewGroup;

    .line 57
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v3

    iget v4, p0, Lginlemon/flower/glass/SLKeyboardDock;->previousBottom:I

    .line 56
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/ViewGroup;->setPadding(IIII)V

    goto :goto_4
.end method
