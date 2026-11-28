.class public final LSLSearchAnimation;
.super Ljava/lang/Object;
.source "SLSearchAnimation.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# instance fields
.field private animator:Landroid/animation/ValueAnimator;

.field private final editor:Landroid/view/View;

.field private final menu:Landroid/view/View;

.field private observer:Landroid/view/ViewTreeObserver;

.field private offsets:[F

.field private final results:Landroid/view/View;

.field private final root:Landroid/view/ViewGroup;

.field private scales:[F

.field private translations:[F

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

    .line 14
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

.method static synthetic access$000(LSLSearchAnimation;)Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 11
    iget-object v0, p0, LSLSearchAnimation;->views:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(LSLSearchAnimation;)[F
    .locals 1

    .prologue
    .line 11
    iget-object v0, p0, LSLSearchAnimation;->scales:[F

    return-object v0
.end method

.method static synthetic access$200(LSLSearchAnimation;)[F
    .locals 1

    .prologue
    .line 11
    iget-object v0, p0, LSLSearchAnimation;->translations:[F

    return-object v0
.end method

.method static synthetic access$300(LSLSearchAnimation;)[F
    .locals 1

    .prologue
    .line 11
    iget-object v0, p0, LSLSearchAnimation;->offsets:[F

    return-object v0
.end method

.method static synthetic access$400(LSLSearchAnimation;)V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, LSLSearchAnimation;->restore()V

    return-void
.end method

.method static synthetic access$500(LSLSearchAnimation;)Landroid/animation/ValueAnimator;
    .locals 1

    .prologue
    .line 11
    iget-object v0, p0, LSLSearchAnimation;->animator:Landroid/animation/ValueAnimator;

    return-object v0
.end method

.method static synthetic access$502(LSLSearchAnimation;Landroid/animation/ValueAnimator;)Landroid/animation/ValueAnimator;
    .locals 0

    .prologue
    .line 11
    iput-object p1, p0, LSLSearchAnimation;->animator:Landroid/animation/ValueAnimator;

    return-object p1
.end method

.method private removeListener()V
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, LSLSearchAnimation;->observer:Landroid/view/ViewTreeObserver;

    if-eqz v0, :cond_0

    iget-object v0, p0, LSLSearchAnimation;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, LSLSearchAnimation;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 29
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, LSLSearchAnimation;->observer:Landroid/view/ViewTreeObserver;

    .line 30
    return-void
.end method

.method private restore()V
    .locals 3

    .prologue
    .line 37
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v0, p0, LSLSearchAnimation;->views:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_0

    .line 38
    iget-object v0, p0, LSLSearchAnimation;->views:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iget-object v2, p0, LSLSearchAnimation;->scales:[F

    aget v2, v2, v1

    invoke-virtual {v0, v2}, Landroid/view/View;->setScaleX(F)V

    .line 39
    iget-object v0, p0, LSLSearchAnimation;->views:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iget-object v2, p0, LSLSearchAnimation;->translations:[F

    aget v2, v2, v1

    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationX(F)V

    .line 37
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    .line 41
    :cond_0
    iget-object v0, p0, LSLSearchAnimation;->views:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 42
    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 7

    .prologue
    const/4 v6, 0x1

    const/4 v1, 0x0

    .line 44
    invoke-direct {p0}, LSLSearchAnimation;->removeListener()V

    .line 45
    iget-object v0, p0, LSLSearchAnimation;->root:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->isShown()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, LSLSearchAnimation;->editor:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    if-nez v0, :cond_1

    .line 78
    :cond_0
    :goto_0
    return v6

    .line 46
    :cond_1
    iget-object v0, p0, LSLSearchAnimation;->editor:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v0

    int-to-float v0, v0

    iget-object v2, p0, LSLSearchAnimation;->editor:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    add-float/2addr v2, v0

    move v0, v1

    .line 47
    :goto_1
    iget-object v3, p0, LSLSearchAnimation;->root:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge v0, v3, :cond_3

    .line 48
    iget-object v3, p0, LSLSearchAnimation;->root:Landroid/view/ViewGroup;

    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 49
    iget-object v4, p0, LSLSearchAnimation;->results:Landroid/view/View;

    if-eq v3, v4, :cond_2

    iget-object v4, p0, LSLSearchAnimation;->menu:Landroid/view/View;

    if-eq v3, v4, :cond_2

    iget-object v4, p0, LSLSearchAnimation;->views:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 47
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 51
    :cond_3
    iget-object v0, p0, LSLSearchAnimation;->views:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 52
    new-array v0, v3, [F

    iput-object v0, p0, LSLSearchAnimation;->scales:[F

    new-array v0, v3, [F

    iput-object v0, p0, LSLSearchAnimation;->translations:[F

    new-array v0, v3, [F

    iput-object v0, p0, LSLSearchAnimation;->offsets:[F

    .line 53
    :goto_2
    if-ge v1, v3, :cond_4

    .line 54
    iget-object v0, p0, LSLSearchAnimation;->views:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 55
    iget-object v4, p0, LSLSearchAnimation;->scales:[F

    invoke-virtual {v0}, Landroid/view/View;->getScaleX()F

    move-result v5

    aput v5, v4, v1

    .line 56
    iget-object v4, p0, LSLSearchAnimation;->translations:[F

    invoke-virtual {v0}, Landroid/view/View;->getTranslationX()F

    move-result v5

    aput v5, v4, v1

    .line 57
    iget-object v4, p0, LSLSearchAnimation;->offsets:[F

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v5

    int-to-float v5, v5

    sub-float v5, v2, v5

    invoke-virtual {v0}, Landroid/view/View;->getPivotX()F

    move-result v0

    sub-float v0, v5, v0

    iget-object v5, p0, LSLSearchAnimation;->translations:[F

    aget v5, v5, v1

    sub-float/2addr v0, v5

    aput v0, v4, v1

    .line 53
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 59
    :cond_4
    const/4 v0, 0x3

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, LSLSearchAnimation;->animator:Landroid/animation/ValueAnimator;

    .line 60
    iget-object v0, p0, LSLSearchAnimation;->animator:Landroid/animation/ValueAnimator;

    const-wide/16 v2, 0x1cc

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 61
    iget-object v0, p0, LSLSearchAnimation;->animator:Landroid/animation/ValueAnimator;

    new-instance v1, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 62
    iget-object v0, p0, LSLSearchAnimation;->animator:Landroid/animation/ValueAnimator;

    new-instance v1, LSLSearchAnimation$1;

    invoke-direct {v1, p0}, LSLSearchAnimation$1;-><init>(LSLSearchAnimation;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 71
    iget-object v0, p0, LSLSearchAnimation;->animator:Landroid/animation/ValueAnimator;

    new-instance v1, LSLSearchAnimation$2;

    invoke-direct {v1, p0}, LSLSearchAnimation$2;-><init>(LSLSearchAnimation;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 77
    iget-object v0, p0, LSLSearchAnimation;->animator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    goto/16 :goto_0

    .line 59
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3e23d70a    # 0.16f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public start()V
    .locals 1

    .prologue
    .line 23
    invoke-virtual {p0}, LSLSearchAnimation;->stop()V

    .line 24
    iget-object v0, p0, LSLSearchAnimation;->root:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iput-object v0, p0, LSLSearchAnimation;->observer:Landroid/view/ViewTreeObserver;

    .line 25
    iget-object v0, p0, LSLSearchAnimation;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, LSLSearchAnimation;->observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 26
    :cond_0
    return-void
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, LSLSearchAnimation;->removeListener()V

    .line 33
    iget-object v0, p0, LSLSearchAnimation;->animator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, LSLSearchAnimation;->animator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, LSLSearchAnimation;->animator:Landroid/animation/ValueAnimator;

    .line 34
    :cond_0
    invoke-direct {p0}, LSLSearchAnimation;->restore()V

    .line 35
    return-void
.end method
