.class public final LSLSearchAnimation;
.super Ljava/lang/Object;
.source "SLSearchAnimation.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# instance fields
.field private animator:Landroid/animation/ValueAnimator;

.field private backdrop:Landroid/view/View;

.field private final editor:Landroid/view/View;

.field private observer:Landroid/view/ViewTreeObserver;

.field private originalScale:F

.field private final root:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, LSLSearchAnimation;->root:Landroid/view/ViewGroup;

    iput-object p2, p0, LSLSearchAnimation;->editor:Landroid/view/View;

    .line 21
    return-void
.end method

.method static synthetic access$000(LSLSearchAnimation;)Landroid/view/View;
    .locals 1

    .prologue
    .line 10
    iget-object v0, p0, LSLSearchAnimation;->backdrop:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$100(LSLSearchAnimation;)F
    .locals 1

    .prologue
    .line 10
    iget v0, p0, LSLSearchAnimation;->originalScale:F

    return v0
.end method

.method static synthetic access$200(LSLSearchAnimation;)V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, LSLSearchAnimation;->restore()V

    return-void
.end method

.method static synthetic access$300(LSLSearchAnimation;)Landroid/animation/ValueAnimator;
    .locals 1

    .prologue
    .line 10
    iget-object v0, p0, LSLSearchAnimation;->animator:Landroid/animation/ValueAnimator;

    return-object v0
.end method

.method static synthetic access$302(LSLSearchAnimation;Landroid/animation/ValueAnimator;)Landroid/animation/ValueAnimator;
    .locals 0

    .prologue
    .line 10
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
    .locals 2

    .prologue
    .line 37
    iget-object v0, p0, LSLSearchAnimation;->backdrop:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, LSLSearchAnimation;->backdrop:Landroid/view/View;

    iget v1, p0, LSLSearchAnimation;->originalScale:F

    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    const/4 v0, 0x0

    iput-object v0, p0, LSLSearchAnimation;->backdrop:Landroid/view/View;

    .line 38
    :cond_0
    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 40
    invoke-direct {p0}, LSLSearchAnimation;->removeListener()V

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

    .line 62
    :cond_0
    :goto_0
    return v4

    .line 42
    :cond_1
    iget-object v0, p0, LSLSearchAnimation;->root:Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 44
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "ginlemon.flower.glass.SLDrawerSearchLayout"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 45
    iput-object v0, p0, LSLSearchAnimation;->backdrop:Landroid/view/View;

    .line 46
    iget-object v0, p0, LSLSearchAnimation;->backdrop:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getScaleX()F

    move-result v0

    iput v0, p0, LSLSearchAnimation;->originalScale:F

    .line 47
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, LSLSearchAnimation;->animator:Landroid/animation/ValueAnimator;

    .line 48
    iget-object v0, p0, LSLSearchAnimation;->animator:Landroid/animation/ValueAnimator;

    const-wide/16 v2, 0xf0

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 49
    iget-object v0, p0, LSLSearchAnimation;->animator:Landroid/animation/ValueAnimator;

    new-instance v1, Landroid/view/animation/PathInterpolator;

    const v2, 0x3e4ccccd    # 0.2f

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v1, v2, v5, v5, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 50
    iget-object v0, p0, LSLSearchAnimation;->animator:Landroid/animation/ValueAnimator;

    new-instance v1, LSLSearchAnimation$1;

    invoke-direct {v1, p0}, LSLSearchAnimation$1;-><init>(LSLSearchAnimation;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 55
    iget-object v0, p0, LSLSearchAnimation;->animator:Landroid/animation/ValueAnimator;

    new-instance v1, LSLSearchAnimation$2;

    invoke-direct {v1, p0}, LSLSearchAnimation$2;-><init>(LSLSearchAnimation;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 61
    iget-object v0, p0, LSLSearchAnimation;->animator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    goto :goto_0

    .line 47
    nop

    :array_0
    .array-data 4
        0x3f6b851f    # 0.92f
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
