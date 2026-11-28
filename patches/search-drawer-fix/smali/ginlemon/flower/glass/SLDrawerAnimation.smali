.class public final Lginlemon/flower/glass/SLDrawerAnimation;
.super Ljava/lang/Object;
.source "SLDrawerAnimation.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# static fields
.field private static active:Lginlemon/flower/glass/SLDrawerAnimation;


# instance fields
.field private final action:Lginlemon/flower/glass/SLDrawerSearchClick;

.field private animator:Landroid/animation/ValueAnimator;

.field private final bar:Landroid/view/View;

.field private cancelled:Z

.field private final clicked:Landroid/view/View;

.field private final clip:Landroid/graphics/Rect;

.field private final previous:Landroid/graphics/Rect;


# direct methods
.method private constructor <init>(Landroid/view/View;Landroid/view/View;Lginlemon/flower/glass/SLDrawerSearchClick;)V
    .locals 1

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lginlemon/flower/glass/SLDrawerAnimation;->clip:Landroid/graphics/Rect;

    .line 19
    iput-object p1, p0, Lginlemon/flower/glass/SLDrawerAnimation;->bar:Landroid/view/View;

    iput-object p2, p0, Lginlemon/flower/glass/SLDrawerAnimation;->clicked:Landroid/view/View;

    iput-object p3, p0, Lginlemon/flower/glass/SLDrawerAnimation;->action:Lginlemon/flower/glass/SLDrawerSearchClick;

    invoke-virtual {p1}, Landroid/view/View;->getClipBounds()Landroid/graphics/Rect;

    move-result-object v0

    iput-object v0, p0, Lginlemon/flower/glass/SLDrawerAnimation;->previous:Landroid/graphics/Rect;

    .line 20
    return-void
.end method

.method static synthetic access$000(Lginlemon/flower/glass/SLDrawerAnimation;)Landroid/view/View;
    .locals 1

    .prologue
    .line 11
    iget-object v0, p0, Lginlemon/flower/glass/SLDrawerAnimation;->bar:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$100(Lginlemon/flower/glass/SLDrawerAnimation;)Landroid/graphics/Rect;
    .locals 1

    .prologue
    .line 11
    iget-object v0, p0, Lginlemon/flower/glass/SLDrawerAnimation;->clip:Landroid/graphics/Rect;

    return-object v0
.end method

.method static synthetic access$200(Lginlemon/flower/glass/SLDrawerAnimation;)Landroid/graphics/Rect;
    .locals 1

    .prologue
    .line 11
    iget-object v0, p0, Lginlemon/flower/glass/SLDrawerAnimation;->previous:Landroid/graphics/Rect;

    return-object v0
.end method

.method static synthetic access$300()Lginlemon/flower/glass/SLDrawerAnimation;
    .locals 1

    .prologue
    .line 11
    sget-object v0, Lginlemon/flower/glass/SLDrawerAnimation;->active:Lginlemon/flower/glass/SLDrawerAnimation;

    return-object v0
.end method

.method static synthetic access$302(Lginlemon/flower/glass/SLDrawerAnimation;)Lginlemon/flower/glass/SLDrawerAnimation;
    .locals 0

    .prologue
    .line 11
    sput-object p0, Lginlemon/flower/glass/SLDrawerAnimation;->active:Lginlemon/flower/glass/SLDrawerAnimation;

    return-object p0
.end method

.method static synthetic access$402(Lginlemon/flower/glass/SLDrawerAnimation;Landroid/animation/ValueAnimator;)Landroid/animation/ValueAnimator;
    .locals 0

    .prologue
    .line 11
    iput-object p1, p0, Lginlemon/flower/glass/SLDrawerAnimation;->animator:Landroid/animation/ValueAnimator;

    return-object p1
.end method

.method static synthetic access$500(Lginlemon/flower/glass/SLDrawerAnimation;)Z
    .locals 1

    .prologue
    .line 11
    iget-boolean v0, p0, Lginlemon/flower/glass/SLDrawerAnimation;->cancelled:Z

    return v0
.end method

.method static synthetic access$600(Lginlemon/flower/glass/SLDrawerAnimation;)Landroid/view/View;
    .locals 1

    .prologue
    .line 11
    iget-object v0, p0, Lginlemon/flower/glass/SLDrawerAnimation;->clicked:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$700(Lginlemon/flower/glass/SLDrawerAnimation;)Lginlemon/flower/glass/SLDrawerSearchClick;
    .locals 1

    .prologue
    .line 11
    iget-object v0, p0, Lginlemon/flower/glass/SLDrawerAnimation;->action:Lginlemon/flower/glass/SLDrawerSearchClick;

    return-object v0
.end method

.method private play()V
    .locals 5

    .prologue
    const/high16 v4, 0x3f800000    # 1.0f

    .line 35
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lginlemon/flower/glass/SLDrawerAnimation;->animator:Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lginlemon/flower/glass/SLDrawerAnimation;->animator:Landroid/animation/ValueAnimator;

    const-wide/16 v2, 0xb4

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 36
    iget-object v0, p0, Lginlemon/flower/glass/SLDrawerAnimation;->animator:Landroid/animation/ValueAnimator;

    new-instance v1, Landroid/view/animation/PathInterpolator;

    const v2, 0x3ecccccd    # 0.4f

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, v4, v4}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 37
    iget-object v0, p0, Lginlemon/flower/glass/SLDrawerAnimation;->animator:Landroid/animation/ValueAnimator;

    new-instance v1, Lginlemon/flower/glass/SLDrawerAnimation$1;

    invoke-direct {v1, p0}, Lginlemon/flower/glass/SLDrawerAnimation$1;-><init>(Lginlemon/flower/glass/SLDrawerAnimation;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 45
    iget-object v0, p0, Lginlemon/flower/glass/SLDrawerAnimation;->animator:Landroid/animation/ValueAnimator;

    new-instance v1, Lginlemon/flower/glass/SLDrawerAnimation$2;

    invoke-direct {v1, p0}, Lginlemon/flower/glass/SLDrawerAnimation$2;-><init>(Lginlemon/flower/glass/SLDrawerAnimation;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 54
    iget-object v0, p0, Lginlemon/flower/glass/SLDrawerAnimation;->animator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 55
    return-void

    .line 35
    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f0ccccd    # 0.55f
    .end array-data
.end method

.method public static start(Landroid/view/View;Lginlemon/flower/glass/SLDrawerSearchClick;)V
    .locals 3

    .prologue
    .line 22
    sget-object v0, Lginlemon/flower/glass/SLDrawerAnimation;->active:Lginlemon/flower/glass/SLDrawerAnimation;

    if-eqz v0, :cond_0

    .line 33
    :goto_0
    return-void

    .line 23
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 24
    instance-of v1, v0, Landroid/view/View;

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "ginlemon.flower.glass.SLDrawerSearchLayout"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 25
    :cond_1
    invoke-virtual {p1, p0}, Lginlemon/flower/glass/SLDrawerSearchClick;->open(Landroid/view/View;)V

    goto :goto_0

    .line 27
    :cond_2
    check-cast v0, Landroid/view/View;

    .line 28
    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v1

    if-nez v1, :cond_4

    .line 29
    :cond_3
    invoke-virtual {p1, p0}, Lginlemon/flower/glass/SLDrawerSearchClick;->open(Landroid/view/View;)V

    goto :goto_0

    .line 31
    :cond_4
    new-instance v1, Lginlemon/flower/glass/SLDrawerAnimation;

    invoke-direct {v1, v0, p0, p1}, Lginlemon/flower/glass/SLDrawerAnimation;-><init>(Landroid/view/View;Landroid/view/View;Lginlemon/flower/glass/SLDrawerSearchClick;)V

    .line 32
    sput-object v1, Lginlemon/flower/glass/SLDrawerAnimation;->active:Lginlemon/flower/glass/SLDrawerAnimation;

    invoke-virtual {v0, v1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-direct {v1}, Lginlemon/flower/glass/SLDrawerAnimation;->play()V

    goto :goto_0
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .locals 0

    .prologue
    .line 56
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 1

    .prologue
    .line 58
    const/4 v0, 0x1

    iput-boolean v0, p0, Lginlemon/flower/glass/SLDrawerAnimation;->cancelled:Z

    .line 59
    iget-object v0, p0, Lginlemon/flower/glass/SLDrawerAnimation;->animator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lginlemon/flower/glass/SLDrawerAnimation;->animator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 60
    :cond_0
    return-void
.end method
