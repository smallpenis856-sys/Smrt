.class public final LSLSearchAnimation;
.super Ljava/lang/Object;
.source "SLSearchAnimation.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# instance fields
.field private animator:Landroid/animation/ValueAnimator;

.field private clips:[Landroid/graphics/Rect;

.field private final editor:Landroid/view/View;

.field private final menu:Landroid/view/View;

.field private observer:Landroid/view/ViewTreeObserver;

.field private previous:[Landroid/graphics/Rect;

.field private final results:Landroid/view/View;

.field private final root:Landroid/view/ViewGroup;

.field private final views:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .locals 1

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, LSLSearchAnimation;->views:Ljava/util/ArrayList;

    .line 20
    iput-object p1, p0, LSLSearchAnimation;->root:Landroid/view/ViewGroup;

    iput-object p2, p0, LSLSearchAnimation;->editor:Landroid/view/View;

    iput-object p3, p0, LSLSearchAnimation;->results:Landroid/view/View;

    iput-object p4, p0, LSLSearchAnimation;->menu:Landroid/view/View;

    .line 21
    return-void
.end method

.method static synthetic access$000(LSLSearchAnimation;)Landroid/view/View;
    .locals 1

    .prologue
    .line 12
    iget-object v0, p0, LSLSearchAnimation;->editor:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$100(LSLSearchAnimation;)Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 12
    iget-object v0, p0, LSLSearchAnimation;->views:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$200(LSLSearchAnimation;)[Landroid/graphics/Rect;
    .locals 1

    .prologue
    .line 12
    iget-object v0, p0, LSLSearchAnimation;->clips:[Landroid/graphics/Rect;

    return-object v0
.end method

.method static synthetic access$300(LSLSearchAnimation;)[Landroid/graphics/Rect;
    .locals 1

    .prologue
    .line 12
    iget-object v0, p0, LSLSearchAnimation;->previous:[Landroid/graphics/Rect;

    return-object v0
.end method

.method static synthetic access$400(LSLSearchAnimation;)V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, LSLSearchAnimation;->restore()V

    return-void
.end method

.method static synthetic access$500(LSLSearchAnimation;)Landroid/animation/ValueAnimator;
    .locals 1

    .prologue
    .line 12
    iget-object v0, p0, LSLSearchAnimation;->animator:Landroid/animation/ValueAnimator;

    return-object v0
.end method

.method static synthetic access$502(LSLSearchAnimation;Landroid/animation/ValueAnimator;)Landroid/animation/ValueAnimator;
    .locals 0

    .prologue
    .line 12
    iput-object p1, p0, LSLSearchAnimation;->animator:Landroid/animation/ValueAnimator;

    return-object p1
.end method

.method private removeListener()V
    .locals 1

    .prologue
    .line 27
    iget-object v0, p0, LSLSearchAnimation;->observer:Landroid/view/ViewTreeObserver;

    if-eqz v0, :cond_0

    iget-object v0, p0, LSLSearchAnimation;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, LSLSearchAnimation;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 28
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, LSLSearchAnimation;->observer:Landroid/view/ViewTreeObserver;

    .line 29
    return-void
.end method

.method private restore()V
    .locals 3

    .prologue
    .line 36
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v0, p0, LSLSearchAnimation;->views:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_0

    iget-object v0, p0, LSLSearchAnimation;->views:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iget-object v2, p0, LSLSearchAnimation;->previous:[Landroid/graphics/Rect;

    aget-object v2, v2, v1

    invoke-virtual {v0, v2}, Landroid/view/View;->setClipBounds(Landroid/graphics/Rect;)V

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    .line 37
    :cond_0
    iget-object v0, p0, LSLSearchAnimation;->views:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 38
    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    const/4 v1, 0x0

    .line 41
    iget-object v0, p0, LSLSearchAnimation;->root:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->isShown()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, LSLSearchAnimation;->editor:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, LSLSearchAnimation;->root:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-nez v0, :cond_1

    .line 72
    :cond_0
    :goto_0
    return v4

    .line 42
    :cond_1
    invoke-direct {p0}, LSLSearchAnimation;->removeListener()V

    .line 43
    iget-object v0, p0, LSLSearchAnimation;->root:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v2, "ginlemon.flower.glass.SLDrawerSearchLayout"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    .line 44
    :goto_1
    iget-object v2, p0, LSLSearchAnimation;->root:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_3

    .line 45
    iget-object v2, p0, LSLSearchAnimation;->root:Landroid/view/ViewGroup;

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 46
    iget-object v3, p0, LSLSearchAnimation;->results:Landroid/view/View;

    if-eq v2, v3, :cond_2

    iget-object v3, p0, LSLSearchAnimation;->menu:Landroid/view/View;

    if-eq v2, v3, :cond_2

    iget-object v3, p0, LSLSearchAnimation;->views:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 48
    :cond_3
    iget-object v0, p0, LSLSearchAnimation;->views:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v0, v2, [Landroid/graphics/Rect;

    iput-object v0, p0, LSLSearchAnimation;->previous:[Landroid/graphics/Rect;

    new-array v0, v2, [Landroid/graphics/Rect;

    iput-object v0, p0, LSLSearchAnimation;->clips:[Landroid/graphics/Rect;

    .line 49
    :goto_2
    if-ge v1, v2, :cond_4

    iget-object v3, p0, LSLSearchAnimation;->previous:[Landroid/graphics/Rect;

    iget-object v0, p0, LSLSearchAnimation;->views:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getClipBounds()Landroid/graphics/Rect;

    move-result-object v0

    aput-object v0, v3, v1

    iget-object v0, p0, LSLSearchAnimation;->clips:[Landroid/graphics/Rect;

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    aput-object v3, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 50
    :cond_4
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, LSLSearchAnimation;->animator:Landroid/animation/ValueAnimator;

    .line 51
    iget-object v0, p0, LSLSearchAnimation;->animator:Landroid/animation/ValueAnimator;

    const-wide/16 v2, 0x118

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 52
    iget-object v0, p0, LSLSearchAnimation;->animator:Landroid/animation/ValueAnimator;

    new-instance v1, Landroid/view/animation/PathInterpolator;

    const v2, 0x3e4ccccd    # 0.2f

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v1, v2, v5, v5, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 53
    iget-object v0, p0, LSLSearchAnimation;->animator:Landroid/animation/ValueAnimator;

    new-instance v1, LSLSearchAnimation$1;

    invoke-direct {v1, p0}, LSLSearchAnimation$1;-><init>(LSLSearchAnimation;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 69
    iget-object v0, p0, LSLSearchAnimation;->animator:Landroid/animation/ValueAnimator;

    new-instance v1, LSLSearchAnimation$2;

    invoke-direct {v1, p0}, LSLSearchAnimation$2;-><init>(LSLSearchAnimation;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 72
    iget-object v0, p0, LSLSearchAnimation;->animator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    goto/16 :goto_0

    .line 50
    nop

    :array_0
    .array-data 4
        0x3f0ccccd    # 0.55f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public start()V
    .locals 1

    .prologue
    .line 23
    invoke-virtual {p0}, LSLSearchAnimation;->stop()V

    iget-object v0, p0, LSLSearchAnimation;->root:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iput-object v0, p0, LSLSearchAnimation;->observer:Landroid/view/ViewTreeObserver;

    .line 24
    iget-object v0, p0, LSLSearchAnimation;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, LSLSearchAnimation;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 25
    :cond_0
    return-void
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 31
    invoke-direct {p0}, LSLSearchAnimation;->removeListener()V

    .line 32
    iget-object v0, p0, LSLSearchAnimation;->animator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, LSLSearchAnimation;->animator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, LSLSearchAnimation;->animator:Landroid/animation/ValueAnimator;

    .line 33
    :cond_0
    invoke-direct {p0}, LSLSearchAnimation;->restore()V

    .line 34
    return-void
.end method
