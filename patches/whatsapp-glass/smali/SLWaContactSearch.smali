.class public final LSLWaContactSearch;
.super Landroid/widget/HorizontalScrollView;
.source "SLWaContactSearch.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LSLWaContactSearch$Contact;
    }
.end annotation


# static fields
.field private static final WORKER:Ljava/util/concurrent/ExecutorService;


# instance fields
.field private final chips:Landroid/widget/LinearLayout;

.field private final editor:Landroid/widget/EditText;

.field private generation:I

.field private final main:Landroid/os/Handler;

.field private pending:Ljava/lang/Runnable;

.field private query:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<*>;"
        }
    .end annotation
.end field

.field private signal:Landroid/os/CancellationSignal;

.field private final watcher:Landroid/text/TextWatcher;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 53
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, LSLWaContactSearch;->WORKER:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Landroid/widget/EditText;)V
    .registers 9

    .prologue
    const/4 v5, -0x2

    const/high16 v3, 0x41800000    # 16.0f

    const/4 v2, 0x0

    .line 69
    invoke-direct {p0, p1}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    .line 54
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, LSLWaContactSearch;->main:Landroid/os/Handler;

    .line 80
    new-instance v0, LSLWaContactSearch$1;

    invoke-direct {v0, p0}, LSLWaContactSearch$1;-><init>(LSLWaContactSearch;)V

    iput-object v0, p0, LSLWaContactSearch;->watcher:Landroid/text/TextWatcher;

    .line 70
    iput-object p2, p0, LSLWaContactSearch;->editor:Landroid/widget/EditText;

    .line 71
    invoke-virtual {p0, v2}, LSLWaContactSearch;->setHorizontalScrollBarEnabled(Z)V

    .line 72
    invoke-virtual {p0, v2}, LSLWaContactSearch;->setFillViewport(Z)V

    .line 73
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, LSLWaContactSearch;->setVisibility(I)V

    .line 74
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, LSLWaContactSearch;->chips:Landroid/widget/LinearLayout;

    .line 75
    iget-object v0, p0, LSLWaContactSearch;->chips:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 76
    iget-object v0, p0, LSLWaContactSearch;->chips:Landroid/widget/LinearLayout;

    invoke-direct {p0, v3}, LSLWaContactSearch;->dp(F)I

    move-result v1

    const/high16 v2, 0x40800000    # 4.0f

    invoke-direct {p0, v2}, LSLWaContactSearch;->dp(F)I

    move-result v2

    invoke-direct {p0, v3}, LSLWaContactSearch;->dp(F)I

    move-result v3

    const/high16 v4, 0x40c00000    # 6.0f

    invoke-direct {p0, v4}, LSLWaContactSearch;->dp(F)I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 77
    iget-object v0, p0, LSLWaContactSearch;->chips:Landroid/widget/LinearLayout;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0, v1}, LSLWaContactSearch;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 78
    return-void
.end method

.method static synthetic access$000(LSLWaContactSearch;)V
    .registers 1

    .prologue
    .line 52
    invoke-direct {p0}, LSLWaContactSearch;->schedule()V

    return-void
.end method

.method static synthetic access$100(LSLWaContactSearch;)V
    .registers 1

    .prologue
    .line 52
    invoke-direct {p0}, LSLWaContactSearch;->askContacts()V

    return-void
.end method

.method static synthetic access$1000(LSLWaContactSearch;Ljava/lang/String;)V
    .registers 2

    .prologue
    .line 52
    invoke-direct {p0, p1}, LSLWaContactSearch;->openWhatsApp(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$202(LSLWaContactSearch;Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .registers 2

    .prologue
    .line 52
    iput-object p1, p0, LSLWaContactSearch;->pending:Ljava/lang/Runnable;

    return-object p1
.end method

.method static synthetic access$302(LSLWaContactSearch;Landroid/os/CancellationSignal;)Landroid/os/CancellationSignal;
    .registers 2

    .prologue
    .line 52
    iput-object p1, p0, LSLWaContactSearch;->signal:Landroid/os/CancellationSignal;

    return-object p1
.end method

.method static synthetic access$402(LSLWaContactSearch;Ljava/util/concurrent/Future;)Ljava/util/concurrent/Future;
    .registers 2

    .prologue
    .line 52
    iput-object p1, p0, LSLWaContactSearch;->query:Ljava/util/concurrent/Future;

    return-object p1
.end method

.method static synthetic access$500(LSLWaContactSearch;Ljava/lang/String;Landroid/os/CancellationSignal;)Ljava/util/List;
    .registers 4

    .prologue
    .line 52
    invoke-direct {p0, p1, p2}, LSLWaContactSearch;->findContacts(Ljava/lang/String;Landroid/os/CancellationSignal;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(LSLWaContactSearch;)I
    .registers 2

    .prologue
    .line 52
    iget v0, p0, LSLWaContactSearch;->generation:I

    return v0
.end method

.method static synthetic access$700(LSLWaContactSearch;Ljava/util/List;)V
    .registers 2

    .prologue
    .line 52
    invoke-direct {p0, p1}, LSLWaContactSearch;->show(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$800(LSLWaContactSearch;)Landroid/os/Handler;
    .registers 2

    .prologue
    .line 52
    iget-object v0, p0, LSLWaContactSearch;->main:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$900()Ljava/util/concurrent/ExecutorService;
    .registers 1

    .prologue
    .line 52
    sget-object v0, LSLWaContactSearch;->WORKER:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method private activity()Landroid/app/Activity;
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 350
    invoke-virtual {p0}, LSLWaContactSearch;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 351
    :goto_5
    instance-of v0, v1, Landroid/content/ContextWrapper;

    if-eqz v0, :cond_19

    instance-of v0, v1, Landroid/app/Activity;

    if-nez v0, :cond_19

    move-object v0, v1

    .line 352
    check-cast v0, Landroid/content/ContextWrapper;

    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    if-ne v0, v1, :cond_17

    .line 354
    :goto_16
    return-object v2

    :cond_17
    move-object v1, v0

    .line 353
    goto :goto_5

    .line 354
    :cond_19
    instance-of v0, v1, Landroid/app/Activity;

    if-eqz v0, :cond_21

    check-cast v1, Landroid/app/Activity;

    :goto_1f
    move-object v2, v1

    goto :goto_16

    :cond_21
    move-object v1, v2

    goto :goto_1f
.end method

.method private addChip(Ljava/lang/String;Landroid/view/View$OnClickListener;)V
    .registers 9

    .prologue
    const/4 v5, -0x2

    const/high16 v4, 0x40a00000    # 5.0f

    const/high16 v3, 0x41600000    # 14.0f

    .line 341
    new-instance v0, Landroid/widget/TextView;

    invoke-virtual {p0}, LSLWaContactSearch;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 342
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 343
    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 344
    const/high16 v1, 0x43700000    # 240.0f

    invoke-direct {p0, v1}, LSLWaContactSearch;->dp(F)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxWidth(I)V

    const/high16 v1, 0x42400000    # 48.0f

    invoke-direct {p0, v1}, LSLWaContactSearch;->dp(F)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMinHeight(I)V

    invoke-direct {p0, v3}, LSLWaContactSearch;->dp(F)I

    move-result v1

    invoke-direct {p0, v4}, LSLWaContactSearch;->dp(F)I

    move-result v2

    invoke-direct {p0, v3}, LSLWaContactSearch;->dp(F)I

    move-result v3

    invoke-direct {p0, v4}, LSLWaContactSearch;->dp(F)I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 345
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v2, -0x1fdad7d5

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v2, 0x41a00000    # 20.0f

    invoke-direct {p0, v2}, LSLWaContactSearch;->dp(F)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 346
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 347
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v2, 0x41000000    # 8.0f

    invoke-direct {p0, v2}, LSLWaContactSearch;->dp(F)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    iget-object v2, p0, LSLWaContactSearch;->chips:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 348
    return-void
.end method

.method private addContactChip(LSLWaContactSearch$Contact;LSLAgendaTheme;Landroid/graphics/drawable/Drawable;Landroid/view/View$OnClickListener;)V
    .registers 14

    .prologue
    .line 242
    invoke-virtual {p0}, LSLWaContactSearch;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 243
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 244
    const/4 v0, 0x0

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 245
    const/16 v0, 0x10

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 246
    const/high16 v0, 0x41400000    # 12.0f

    invoke-direct {p0, v0}, LSLWaContactSearch;->dp(F)I

    move-result v0

    const/high16 v1, 0x41000000    # 8.0f

    invoke-direct {p0, v1}, LSLWaContactSearch;->dp(F)I

    move-result v1

    const/high16 v4, 0x41600000    # 14.0f

    invoke-direct {p0, v4}, LSLWaContactSearch;->dp(F)I

    move-result v4

    const/high16 v5, 0x41000000    # 8.0f

    invoke-direct {p0, v5}, LSLWaContactSearch;->dp(F)I

    move-result v5

    invoke-virtual {v3, v0, v1, v4, v5}, Landroid/widget/LinearLayout;->setPaddingRelative(IIII)V

    .line 247
    const/high16 v0, 0x42600000    # 56.0f

    invoke-direct {p0, v0}, LSLWaContactSearch;->dp(F)I

    move-result v0

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    .line 248
    new-instance v4, Landroid/widget/FrameLayout;

    invoke-direct {v4, v2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 249
    const/4 v0, 0x0

    .line 251
    :try_start_3c
    invoke-virtual {p0}, LSLWaContactSearch;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v5, "wa_contact_glass"

    const-string v6, "layout"

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v5, v6, v7}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 252
    if-eqz v1, :cond_62

    .line 253
    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v1, v4, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 254
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v6, -0x1

    const/4 v7, -0x1

    invoke-direct {v5, v6, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v1, v5}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_61
    .catch Ljava/lang/RuntimeException; {:try_start_3c .. :try_end_61} :catch_28f

    .line 255
    const/4 v0, 0x1

    .line 260
    :cond_62
    :goto_62
    new-instance v5, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 261
    if-eqz v0, :cond_20f

    const/4 v1, 0x0

    :goto_6a
    invoke-virtual {v5, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 262
    if-eqz v0, :cond_21d

    const/high16 v1, 0x41e00000    # 28.0f

    :goto_71
    invoke-direct {p0, v1}, LSLWaContactSearch;->dp(F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v5, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 263
    if-nez v0, :cond_8b

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {p0, v1}, LSLWaContactSearch;->dp(F)I

    move-result v6

    iget-boolean v1, p2, LSLAgendaTheme;->isLight:Z

    if-eqz v1, :cond_221

    const v1, 0x381fa855

    :goto_88
    invoke-virtual {v5, v6, v1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 264
    :cond_8b
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 265
    const/4 v6, -0x1

    invoke-virtual {v1, v6}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 266
    if-eqz v0, :cond_226

    const/high16 v0, 0x41e00000    # 28.0f

    :goto_98
    invoke-direct {p0, v0}, LSLWaContactSearch;->dp(F)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 267
    new-instance v6, Landroid/graphics/drawable/RippleDrawable;

    iget-boolean v0, p2, LSLAgendaTheme;->isLight:Z

    if-eqz v0, :cond_22a

    const v0, 0x241fa855

    :goto_a9
    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-direct {v6, v0, v5, v1}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 270
    iget-object v0, p1, LSLWaContactSearch$Contact;->photo:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_234

    .line 271
    new-instance v1, Landroid/widget/FrameLayout;

    invoke-direct {v1, v2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 272
    new-instance v5, Landroid/widget/ImageView;

    invoke-direct {v5, v2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 273
    iget-object v0, p1, LSLWaContactSearch$Contact;->photo:Landroid/graphics/Bitmap;

    invoke-virtual {v5, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 274
    sget-object v0, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v5, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 275
    new-instance v6, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v6}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 276
    const/4 v0, 0x1

    invoke-virtual {v6, v0}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 277
    iget-boolean v0, p2, LSLAgendaTheme;->isLight:Z

    if-eqz v0, :cond_22f

    const v0, -0x171216

    :goto_db
    invoke-virtual {v6, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 278
    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 279
    const/4 v0, 0x1

    invoke-virtual {v5, v0}, Landroid/widget/ImageView;->setClipToOutline(Z)V

    .line 280
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v6, -0x1

    const/4 v7, -0x1

    invoke-direct {v0, v6, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v5, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 281
    if-eqz p3, :cond_127

    .line 282
    new-instance v0, Landroid/widget/ImageView;

    invoke-direct {v0, v2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 283
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v5

    if-eqz v5, :cond_108

    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v5

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p3

    :cond_108
    invoke-virtual {v0, p3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 284
    sget-object v5, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v5}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 285
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    const/high16 v6, 0x41800000    # 16.0f

    invoke-direct {p0, v6}, LSLWaContactSearch;->dp(F)I

    move-result v6

    const/high16 v7, 0x41800000    # 16.0f

    invoke-direct {p0, v7}, LSLWaContactSearch;->dp(F)I

    move-result v7

    const v8, 0x800055

    invoke-direct {v5, v6, v7, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v1, v0, v5}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_127
    move-object v0, v1

    .line 306
    :goto_128
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 307
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x42100000    # 36.0f

    invoke-direct {p0, v5}, LSLWaContactSearch;->dp(F)I

    move-result v5

    const/high16 v6, 0x42100000    # 36.0f

    invoke-direct {p0, v6}, LSLWaContactSearch;->dp(F)I

    move-result v6

    invoke-direct {v1, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 308
    const/high16 v5, 0x41200000    # 10.0f

    invoke-direct {p0, v5}, LSLWaContactSearch;->dp(F)I

    move-result v5

    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 309
    invoke-virtual {v3, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 311
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 312
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 313
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 314
    iget-object v5, p1, LSLWaContactSearch$Contact;->name:Ljava/lang/String;

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 315
    iget v5, p2, LSLAgendaTheme;->textPrimary:I

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 316
    const/high16 v5, 0x41700000    # 15.0f

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setTextSize(F)V

    .line 317
    sget-object v5, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    const/4 v6, 0x1

    invoke-virtual {v1, v5, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 318
    const/4 v5, 0x1

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 319
    sget-object v5, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 320
    const/high16 v5, 0x43300000    # 176.0f

    invoke-direct {p0, v5}, LSLWaContactSearch;->dp(F)I

    move-result v5

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 321
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 322
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 323
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "+"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v5, p1, LSLWaContactSearch$Contact;->phone:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 324
    iget v2, p2, LSLAgendaTheme;->textSecondary:I

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 325
    const/high16 v2, 0x41400000    # 12.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 326
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 327
    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextDirection(I)V

    .line 328
    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 329
    const/high16 v2, 0x43300000    # 176.0f

    invoke-direct {p0, v2}, LSLWaContactSearch;->dp(F)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 330
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 331
    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setImportantForAccessibility(I)V

    .line 332
    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 333
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "WhatsApp, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, LSLWaContactSearch$Contact;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", +"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, LSLWaContactSearch$Contact;->phone:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 334
    invoke-virtual {v3, p4}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 335
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x2

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v3, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 336
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 337
    const/high16 v1, 0x41000000    # 8.0f

    invoke-direct {p0, v1}, LSLWaContactSearch;->dp(F)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 338
    iget-object v1, p0, LSLWaContactSearch;->chips:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v4, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 339
    return-void

    .line 261
    :cond_20f
    iget-boolean v1, p2, LSLAgendaTheme;->isLight:Z

    if-eqz v1, :cond_218

    const v1, -0x11000001

    goto/16 :goto_6a

    :cond_218
    const v1, -0x19e4dfd8    # -1.8314E23f

    goto/16 :goto_6a

    .line 262
    :cond_21d
    const/high16 v1, 0x41800000    # 16.0f

    goto/16 :goto_71

    .line 263
    :cond_221
    const v1, 0x4d25d366    # 1.73880928E8f

    goto/16 :goto_88

    .line 266
    :cond_226
    const/high16 v0, 0x41800000    # 16.0f

    goto/16 :goto_98

    .line 267
    :cond_22a
    const v0, 0x3325d366

    goto/16 :goto_a9

    .line 277
    :cond_22f
    const v0, -0xcbc4c8

    goto/16 :goto_db

    .line 288
    :cond_234
    if-eqz p3, :cond_257

    .line 289
    new-instance v0, Landroid/widget/ImageView;

    invoke-direct {v0, v2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 290
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v1

    if-eqz v1, :cond_24d

    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p3

    :cond_24d
    invoke-virtual {v0, p3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 291
    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    goto/16 :goto_128

    .line 294
    :cond_257
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 295
    const-string v1, "WA"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 296
    const/high16 v1, 0x41300000    # 11.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 297
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    const/4 v5, 0x1

    invoke-virtual {v0, v1, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 298
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 299
    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 300
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 301
    const v5, -0xed73b6

    invoke-virtual {v1, v5}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 302
    const/high16 v5, 0x41900000    # 18.0f

    invoke-direct {p0, v5}, LSLWaContactSearch;->dp(F)I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v1, v5}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 303
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_128

    .line 257
    :catch_28f
    move-exception v1

    goto/16 :goto_62
.end method

.method private askContacts()V
    .registers 5

    .prologue
    .line 357
    invoke-direct {p0}, LSLWaContactSearch;->activity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_c

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-eqz v1, :cond_d

    .line 368
    :cond_c
    :goto_c
    return-void

    .line 358
    :cond_d
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "Find WhatsApp contacts"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Search matching phone contacts on this device. WhatsApp opens only when you tap a result. Chat messages are not read."

    .line 359
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Allow"

    new-instance v3, LSLWaContactSearch$6;

    invoke-direct {v3, p0, v0}, LSLWaContactSearch$6;-><init>(LSLWaContactSearch;Landroid/app/Activity;)V

    .line 360
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "App settings"

    new-instance v3, LSLWaContactSearch$5;

    invoke-direct {v3, p0, v0}, LSLWaContactSearch$5;-><init>(LSLWaContactSearch;Landroid/app/Activity;)V

    .line 362
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Cancel"

    const/4 v2, 0x0

    .line 367
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_c
.end method

.method public static attach(Landroid/widget/EditText;Landroid/widget/LinearLayout;)V
    .registers 7

    .prologue
    .line 63
    if-eqz p0, :cond_c

    if-eqz p1, :cond_c

    const-string v0, "sl_wa_contact_search"

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_d

    .line 67
    :cond_c
    :goto_c
    return-void

    .line 64
    :cond_d
    new-instance v0, LSLWaContactSearch;

    invoke-virtual {p0}, Landroid/widget/EditText;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p0}, LSLWaContactSearch;-><init>(Landroid/content/Context;Landroid/widget/EditText;)V

    .line 65
    const-string v1, "sl_wa_contact_search"

    invoke-virtual {v0, v1}, LSLWaContactSearch;->setTag(Ljava/lang/Object;)V

    .line 66
    const/4 v1, 0x1

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    goto :goto_c
.end method

.method private cancel()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 101
    iget v0, p0, LSLWaContactSearch;->generation:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, LSLWaContactSearch;->generation:I

    .line 102
    iget-object v0, p0, LSLWaContactSearch;->pending:Ljava/lang/Runnable;

    if-eqz v0, :cond_14

    iget-object v0, p0, LSLWaContactSearch;->main:Landroid/os/Handler;

    iget-object v1, p0, LSLWaContactSearch;->pending:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iput-object v2, p0, LSLWaContactSearch;->pending:Ljava/lang/Runnable;

    .line 103
    :cond_14
    iget-object v0, p0, LSLWaContactSearch;->signal:Landroid/os/CancellationSignal;

    if-eqz v0, :cond_1f

    iget-object v0, p0, LSLWaContactSearch;->signal:Landroid/os/CancellationSignal;

    invoke-virtual {v0}, Landroid/os/CancellationSignal;->cancel()V

    iput-object v2, p0, LSLWaContactSearch;->signal:Landroid/os/CancellationSignal;

    .line 104
    :cond_1f
    iget-object v0, p0, LSLWaContactSearch;->query:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_2b

    iget-object v0, p0, LSLWaContactSearch;->query:Ljava/util/concurrent/Future;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    iput-object v2, p0, LSLWaContactSearch;->query:Ljava/util/concurrent/Future;

    .line 105
    :cond_2b
    return-void
.end method

.method private static country(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    .prologue
    .line 214
    :try_start_0
    const-string v0, "phone"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 215
    if-eqz v0, :cond_1f

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimCountryIso()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1f

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimCountryIso()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 218
    :goto_1e
    return-object v0

    .line 216
    :cond_1f
    if-eqz v0, :cond_37

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getNetworkCountryIso()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_37

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getNetworkCountryIso()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;
    :try_end_34
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_34} :catch_36

    move-result-object v0

    goto :goto_1e

    .line 217
    :catch_36
    move-exception v0

    .line 218
    :cond_37
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1e
.end method

.method private dp(F)I
    .registers 3

    .prologue
    .line 79
    invoke-virtual {p0}, LSLWaContactSearch;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0
.end method

.method private findContacts(Ljava/lang/String;Landroid/os/CancellationSignal;)Ljava/util/List;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/os/CancellationSignal;",
            ")",
            "Ljava/util/List",
            "<",
            "LSLWaContactSearch$Contact;",
            ">;"
        }
    .end annotation

    .prologue
    .line 140
    invoke-virtual {p0}, LSLWaContactSearch;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    .line 143
    const/4 v0, 0x1

    :try_start_9
    invoke-direct {p0, v3, p1, p2, v0}, LSLWaContactSearch;->queryContacts(Landroid/content/Context;Ljava/lang/String;Landroid/os/CancellationSignal;Z)Ljava/util/List;
    :try_end_c
    .catch Ljava/lang/RuntimeException; {:try_start_9 .. :try_end_c} :catch_2a

    move-result-object v0

    move-object v2, v0

    .line 150
    :goto_e
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 151
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_17
    :goto_17
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_29

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, LSLWaContactSearch$Contact;

    .line 152
    invoke-virtual {p2}, Landroid/os/CancellationSignal;->isCanceled()Z

    move-result v1

    if-eqz v1, :cond_45

    .line 159
    :cond_29
    :goto_29
    return-object v2

    .line 144
    :catch_2a
    move-exception v0

    .line 145
    invoke-virtual {p2}, Landroid/os/CancellationSignal;->isCanceled()Z

    move-result v0

    if-eqz v0, :cond_37

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    goto :goto_29

    .line 146
    :cond_37
    const/4 v0, 0x0

    :try_start_38
    invoke-direct {p0, v3, p1, p2, v0}, LSLWaContactSearch;->queryContacts(Landroid/content/Context;Ljava/lang/String;Landroid/os/CancellationSignal;Z)Ljava/util/List;
    :try_end_3b
    .catch Ljava/lang/RuntimeException; {:try_start_38 .. :try_end_3b} :catch_3e

    move-result-object v0

    move-object v2, v0

    .line 147
    goto :goto_e

    :catch_3e
    move-exception v0

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    goto :goto_29

    .line 153
    :cond_45
    iget-object v1, v0, LSLWaContactSearch$Contact;->photoUri:Ljava/lang/String;

    if-eqz v1, :cond_17

    .line 154
    iget-object v1, v0, LSLWaContactSearch$Contact;->photoUri:Ljava/lang/String;

    invoke-virtual {v4, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5c

    .line 155
    iget-object v1, v0, LSLWaContactSearch$Contact;->photoUri:Ljava/lang/String;

    iget-object v6, v0, LSLWaContactSearch$Contact;->photoUri:Ljava/lang/String;

    invoke-direct {p0, v3, v6, p2}, LSLWaContactSearch;->loadPhoto(Landroid/content/Context;Ljava/lang/String;Landroid/os/CancellationSignal;)Landroid/graphics/Bitmap;

    move-result-object v6

    invoke-virtual {v4, v1, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    :cond_5c
    iget-object v1, v0, LSLWaContactSearch$Contact;->photoUri:Ljava/lang/String;

    invoke-virtual {v4, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    iput-object v1, v0, LSLWaContactSearch$Contact;->photo:Landroid/graphics/Bitmap;

    goto :goto_17
.end method

.method private loadPhoto(Landroid/content/Context;Ljava/lang/String;Landroid/os/CancellationSignal;)Landroid/graphics/Bitmap;
    .registers 10

    .prologue
    const/4 v0, 0x0

    .line 191
    :try_start_1
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 192
    const-string v2, "content"

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_23

    const-string v2, "com.android.contacts"

    invoke-virtual {v1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_23

    invoke-virtual {p3}, Landroid/os/CancellationSignal;->isCanceled()Z

    move-result v2

    if-eqz v2, :cond_24

    .line 209
    :cond_23
    :goto_23
    return-object v0

    .line 193
    :cond_24
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 194
    const/4 v3, 0x1

    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 195
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "r"

    invoke-virtual {v3, v1, v4, p3}, Landroid/content/ContentResolver;->openAssetFileDescriptor(Landroid/net/Uri;Ljava/lang/String;Landroid/os/CancellationSignal;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v3

    .line 196
    if-nez v3, :cond_40

    .line 198
    if-eqz v3, :cond_23

    invoke-virtual {v3}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_3d
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_3d} :catch_3e
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_3d} :catch_7f

    goto :goto_23

    .line 207
    :catch_3e
    move-exception v1

    goto :goto_23

    .line 197
    :cond_40
    :try_start_40
    invoke-virtual {v3}, Landroid/content/res/AssetFileDescriptor;->createInputStream()Ljava/io/FileInputStream;
    :try_end_43
    .catch Ljava/lang/Throwable; {:try_start_40 .. :try_end_43} :catch_88
    .catch Ljava/io/IOException; {:try_start_40 .. :try_end_43} :catch_3e
    .catch Ljava/lang/RuntimeException; {:try_start_40 .. :try_end_43} :catch_7f

    move-result-object v4

    const/4 v5, 0x0

    :try_start_45
    invoke-static {v4, v5, v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_48
    .catch Ljava/lang/Throwable; {:try_start_45 .. :try_end_48} :catch_81
    .catch Ljava/io/IOException; {:try_start_45 .. :try_end_48} :catch_3e
    .catch Ljava/lang/RuntimeException; {:try_start_45 .. :try_end_48} :catch_7f

    if-eqz v4, :cond_4d

    :try_start_4a
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_4d
    .catch Ljava/lang/Throwable; {:try_start_4a .. :try_end_4d} :catch_88
    .catch Ljava/io/IOException; {:try_start_4a .. :try_end_4d} :catch_3e
    .catch Ljava/lang/RuntimeException; {:try_start_4a .. :try_end_4d} :catch_7f

    .line 198
    :cond_4d
    if-eqz v3, :cond_52

    :try_start_4f
    invoke-virtual {v3}, Landroid/content/res/AssetFileDescriptor;->close()V

    .line 199
    :cond_52
    iget v3, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v4, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    const/high16 v5, 0x42400000    # 48.0f

    invoke-direct {p0, v5}, LSLWaContactSearch;->dp(F)I

    move-result v5

    invoke-static {v3, v4, v5}, LSLPhotoPolicy;->sampleSize(III)I

    move-result v3

    .line 200
    if-eqz v3, :cond_23

    invoke-virtual {p3}, Landroid/os/CancellationSignal;->isCanceled()Z

    move-result v4

    if-nez v4, :cond_23

    .line 201
    const/4 v4, 0x0

    iput-boolean v4, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 202
    iput v3, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 203
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "r"

    invoke-virtual {v3, v1, v4, p3}, Landroid/content/ContentResolver;->openAssetFileDescriptor(Landroid/net/Uri;Ljava/lang/String;Landroid/os/CancellationSignal;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v3

    .line 204
    if-nez v3, :cond_99

    .line 206
    if-eqz v3, :cond_23

    invoke-virtual {v3}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_7e
    .catch Ljava/io/IOException; {:try_start_4f .. :try_end_7e} :catch_3e
    .catch Ljava/lang/RuntimeException; {:try_start_4f .. :try_end_7e} :catch_7f

    goto :goto_23

    .line 207
    :catch_7f
    move-exception v1

    goto :goto_23

    .line 197
    :catch_81
    move-exception v1

    if-eqz v4, :cond_87

    :try_start_84
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_87
    .catch Ljava/lang/Throwable; {:try_start_84 .. :try_end_87} :catch_8f
    .catch Ljava/io/IOException; {:try_start_84 .. :try_end_87} :catch_3e
    .catch Ljava/lang/RuntimeException; {:try_start_84 .. :try_end_87} :catch_7f

    :cond_87
    :goto_87
    :try_start_87
    throw v1
    :try_end_88
    .catch Ljava/lang/Throwable; {:try_start_87 .. :try_end_88} :catch_88
    .catch Ljava/io/IOException; {:try_start_87 .. :try_end_88} :catch_3e
    .catch Ljava/lang/RuntimeException; {:try_start_87 .. :try_end_88} :catch_7f

    .line 195
    :catch_88
    move-exception v1

    if-eqz v3, :cond_8e

    :try_start_8b
    invoke-virtual {v3}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_8e
    .catch Ljava/lang/Throwable; {:try_start_8b .. :try_end_8e} :catch_94
    .catch Ljava/io/IOException; {:try_start_8b .. :try_end_8e} :catch_3e
    .catch Ljava/lang/RuntimeException; {:try_start_8b .. :try_end_8e} :catch_7f

    :cond_8e
    :goto_8e
    :try_start_8e
    throw v1
    :try_end_8f
    .catch Ljava/io/IOException; {:try_start_8e .. :try_end_8f} :catch_3e
    .catch Ljava/lang/RuntimeException; {:try_start_8e .. :try_end_8f} :catch_7f

    .line 197
    :catch_8f
    move-exception v2

    :try_start_90
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_93
    .catch Ljava/lang/Throwable; {:try_start_90 .. :try_end_93} :catch_88
    .catch Ljava/io/IOException; {:try_start_90 .. :try_end_93} :catch_3e
    .catch Ljava/lang/RuntimeException; {:try_start_90 .. :try_end_93} :catch_7f

    goto :goto_87

    .line 195
    :catch_94
    move-exception v2

    :try_start_95
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_98
    .catch Ljava/io/IOException; {:try_start_95 .. :try_end_98} :catch_3e
    .catch Ljava/lang/RuntimeException; {:try_start_95 .. :try_end_98} :catch_7f

    goto :goto_8e

    .line 205
    :cond_99
    :try_start_99
    invoke-virtual {v3}, Landroid/content/res/AssetFileDescriptor;->createInputStream()Ljava/io/FileInputStream;
    :try_end_9c
    .catch Ljava/lang/Throwable; {:try_start_99 .. :try_end_9c} :catch_b6
    .catch Ljava/io/IOException; {:try_start_99 .. :try_end_9c} :catch_3e
    .catch Ljava/lang/RuntimeException; {:try_start_99 .. :try_end_9c} :catch_7f

    move-result-object v4

    const/4 v1, 0x0

    :try_start_9e
    invoke-static {v4, v1, v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_a1
    .catch Ljava/lang/Throwable; {:try_start_9e .. :try_end_a1} :catch_af
    .catch Ljava/io/IOException; {:try_start_9e .. :try_end_a1} :catch_3e
    .catch Ljava/lang/RuntimeException; {:try_start_9e .. :try_end_a1} :catch_7f

    move-result-object v1

    if-eqz v4, :cond_a7

    :try_start_a4
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_a7
    .catch Ljava/lang/Throwable; {:try_start_a4 .. :try_end_a7} :catch_b6
    .catch Ljava/io/IOException; {:try_start_a4 .. :try_end_a7} :catch_3e
    .catch Ljava/lang/RuntimeException; {:try_start_a4 .. :try_end_a7} :catch_7f

    .line 206
    :cond_a7
    if-eqz v3, :cond_ac

    :try_start_a9
    invoke-virtual {v3}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_ac
    .catch Ljava/io/IOException; {:try_start_a9 .. :try_end_ac} :catch_3e
    .catch Ljava/lang/RuntimeException; {:try_start_a9 .. :try_end_ac} :catch_7f

    :cond_ac
    move-object v0, v1

    .line 205
    goto/16 :goto_23

    :catch_af
    move-exception v1

    if-eqz v4, :cond_b5

    :try_start_b2
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_b5
    .catch Ljava/lang/Throwable; {:try_start_b2 .. :try_end_b5} :catch_bd
    .catch Ljava/io/IOException; {:try_start_b2 .. :try_end_b5} :catch_3e
    .catch Ljava/lang/RuntimeException; {:try_start_b2 .. :try_end_b5} :catch_7f

    :cond_b5
    :goto_b5
    :try_start_b5
    throw v1
    :try_end_b6
    .catch Ljava/lang/Throwable; {:try_start_b5 .. :try_end_b6} :catch_b6
    .catch Ljava/io/IOException; {:try_start_b5 .. :try_end_b6} :catch_3e
    .catch Ljava/lang/RuntimeException; {:try_start_b5 .. :try_end_b6} :catch_7f

    .line 203
    :catch_b6
    move-exception v1

    if-eqz v3, :cond_bc

    :try_start_b9
    invoke-virtual {v3}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_bc
    .catch Ljava/lang/Throwable; {:try_start_b9 .. :try_end_bc} :catch_c2
    .catch Ljava/io/IOException; {:try_start_b9 .. :try_end_bc} :catch_3e
    .catch Ljava/lang/RuntimeException; {:try_start_b9 .. :try_end_bc} :catch_7f

    :cond_bc
    :goto_bc
    :try_start_bc
    throw v1
    :try_end_bd
    .catch Ljava/io/IOException; {:try_start_bc .. :try_end_bd} :catch_3e
    .catch Ljava/lang/RuntimeException; {:try_start_bc .. :try_end_bd} :catch_7f

    .line 205
    :catch_bd
    move-exception v2

    :try_start_be
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_c1
    .catch Ljava/lang/Throwable; {:try_start_be .. :try_end_c1} :catch_b6
    .catch Ljava/io/IOException; {:try_start_be .. :try_end_c1} :catch_3e
    .catch Ljava/lang/RuntimeException; {:try_start_be .. :try_end_c1} :catch_7f

    goto :goto_b5

    .line 203
    :catch_c2
    move-exception v2

    :try_start_c3
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_c6
    .catch Ljava/io/IOException; {:try_start_c3 .. :try_end_c6} :catch_3e
    .catch Ljava/lang/RuntimeException; {:try_start_c3 .. :try_end_c6} :catch_7f

    goto :goto_bc
.end method

.method private openWhatsApp(Ljava/lang/String;)V
    .registers 11

    .prologue
    const/4 v8, 0x1

    const/4 v0, 0x0

    .line 370
    invoke-virtual {p0}, LSLWaContactSearch;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 371
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "whatsapp://send?phone="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 372
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const-string v4, "com.whatsapp"

    aput-object v4, v3, v0

    const-string v4, "com.whatsapp.w4b"

    aput-object v4, v3, v8

    array-length v4, v3

    :goto_29
    if-ge v0, v4, :cond_53

    aget-object v5, v3, v0

    .line 373
    new-instance v6, Landroid/content/Intent;

    const-string v7, "android.intent.action.VIEW"

    invoke-direct {v6, v7, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v6, v5}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v5

    .line 374
    instance-of v6, v1, Landroid/app/Activity;

    if-nez v6, :cond_41

    const/high16 v6, 0x10000000

    invoke-virtual {v5, v6}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 375
    :cond_41
    :try_start_41
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v6

    if-eqz v6, :cond_50

    invoke-virtual {v1, v5}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_4e
    .catch Landroid/content/ActivityNotFoundException; {:try_start_41 .. :try_end_4e} :catch_4f
    .catch Ljava/lang/SecurityException; {:try_start_41 .. :try_end_4e} :catch_5d

    .line 379
    :goto_4e
    return-void

    .line 376
    :catch_4f
    move-exception v5

    .line 372
    :cond_50
    :goto_50
    add-int/lit8 v0, v0, 0x1

    goto :goto_29

    .line 378
    :cond_53
    const-string v0, "WhatsApp is not available on this device"

    invoke-static {v1, v0, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_4e

    .line 376
    :catch_5d
    move-exception v5

    goto :goto_50
.end method

.method private queryContacts(Landroid/content/Context;Ljava/lang/String;Landroid/os/CancellationSignal;Z)Ljava/util/List;
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Landroid/os/CancellationSignal;",
            "Z)",
            "Ljava/util/List",
            "<",
            "LSLWaContactSearch$Contact;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v9, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 162
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 163
    new-instance v8, Ljava/util/HashSet;

    invoke-direct {v8}, Ljava/util/HashSet;-><init>()V

    .line 164
    sget-object v0, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_FILTER_URI:Landroid/net/Uri;

    invoke-static {p2}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 165
    if-eqz p4, :cond_57

    const/4 v0, 0x4

    new-array v2, v0, [Ljava/lang/String;

    const-string v0, "display_name"

    aput-object v0, v2, v4

    const-string v0, "data1"

    aput-object v0, v2, v5

    const-string v0, "data4"

    aput-object v0, v2, v6

    const-string v0, "photo_thumb_uri"

    aput-object v0, v2, v9

    .line 170
    :goto_2e
    invoke-static {p1}, LSLWaContactSearch;->country(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v9

    .line 171
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v5, "display_name COLLATE LOCALIZED ASC"

    move-object v4, v3

    move-object v6, p3

    invoke-virtual/range {v0 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Landroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v2

    .line 173
    if-nez v2, :cond_66

    if-eqz p4, :cond_66

    :try_start_42
    invoke-virtual {p3}, Landroid/os/CancellationSignal;->isCanceled()Z

    move-result v0

    if-nez v0, :cond_66

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No contacts cursor"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_50
    .catch Ljava/lang/Throwable; {:try_start_42 .. :try_end_50} :catch_50

    .line 171
    :catch_50
    move-exception v0

    if-eqz v2, :cond_56

    :try_start_53
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_56
    .catch Ljava/lang/Throwable; {:try_start_53 .. :try_end_56} :catch_d1

    :cond_56
    :goto_56
    throw v0

    .line 167
    :cond_57
    new-array v2, v9, [Ljava/lang/String;

    const-string v0, "display_name"

    aput-object v0, v2, v4

    const-string v0, "data1"

    aput-object v0, v2, v5

    const-string v0, "data4"

    aput-object v0, v2, v6

    goto :goto_2e

    .line 175
    :cond_66
    :goto_66
    if-eqz v2, :cond_cb

    :try_start_68
    invoke-virtual {p3}, Landroid/os/CancellationSignal;->isCanceled()Z

    move-result v0

    if-nez v0, :cond_cb

    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_cb

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x5

    if-ge v0, v1, :cond_cb

    .line 176
    const/4 v0, 0x0

    invoke-interface {v2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v0, 0x1

    invoke-interface {v2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 177
    invoke-static {v1}, LSLWaPhone;->plainNumber(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_66

    .line 178
    const/4 v0, 0x2

    invoke-interface {v2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, LSLWaPhone;->digits(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 179
    if-nez v0, :cond_9a

    invoke-static {v1}, LSLWaPhone;->digits(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 180
    :cond_9a
    if-nez v0, :cond_d6

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_d6

    .line 181
    invoke-static {v1, v9}, Landroid/telephony/PhoneNumberUtils;->formatNumberToE164(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, LSLWaPhone;->digits(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    .line 182
    :goto_ab
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_66

    if-eqz v1, :cond_66

    invoke-virtual {v8, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_66

    .line 183
    new-instance v5, LSLWaContactSearch$Contact;

    if-eqz p4, :cond_c9

    const/4 v0, 0x3

    invoke-interface {v2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_c2
    invoke-direct {v5, v4, v1, v0}, LSLWaContactSearch$Contact;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v7, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_c8
    .catch Ljava/lang/Throwable; {:try_start_68 .. :try_end_c8} :catch_50

    goto :goto_66

    :cond_c9
    move-object v0, v3

    goto :goto_c2

    .line 186
    :cond_cb
    if-eqz v2, :cond_d0

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 187
    :cond_d0
    return-object v7

    .line 171
    :catch_d1
    move-exception v1

    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_56

    :cond_d6
    move-object v1, v0

    goto :goto_ab
.end method

.method private schedule()V
    .registers 5

    .prologue
    .line 107
    invoke-direct {p0}, LSLWaContactSearch;->cancel()V

    .line 108
    iget-object v0, p0, LSLWaContactSearch;->chips:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 109
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, LSLWaContactSearch;->setVisibility(I)V

    .line 110
    iget-object v0, p0, LSLWaContactSearch;->editor:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    if-nez v0, :cond_25

    const-string v0, ""

    .line 111
    :goto_17
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x2

    if-lt v1, v2, :cond_24

    invoke-virtual {p0}, LSLWaContactSearch;->isAttachedToWindow()Z

    move-result v1

    if-nez v1, :cond_34

    .line 131
    :cond_24
    :goto_24
    return-void

    .line 110
    :cond_25
    iget-object v0, p0, LSLWaContactSearch;->editor:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    goto :goto_17

    .line 112
    :cond_34
    invoke-virtual {p0}, LSLWaContactSearch;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "android.permission.READ_CONTACTS"

    invoke-virtual {v1, v2}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_4f

    .line 113
    const-string v0, "Allow contacts for WhatsApp"

    new-instance v1, LSLWaContactSearch$2;

    invoke-direct {v1, p0}, LSLWaContactSearch$2;-><init>(LSLWaContactSearch;)V

    invoke-direct {p0, v0, v1}, LSLWaContactSearch;->addChip(Ljava/lang/String;Landroid/view/View$OnClickListener;)V

    .line 114
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, LSLWaContactSearch;->setVisibility(I)V

    goto :goto_24

    .line 117
    :cond_4f
    iget v1, p0, LSLWaContactSearch;->generation:I

    .line 118
    new-instance v2, LSLWaContactSearch$3;

    invoke-direct {v2, p0, v0, v1}, LSLWaContactSearch$3;-><init>(LSLWaContactSearch;Ljava/lang/String;I)V

    iput-object v2, p0, LSLWaContactSearch;->pending:Ljava/lang/Runnable;

    .line 130
    iget-object v0, p0, LSLWaContactSearch;->main:Landroid/os/Handler;

    iget-object v1, p0, LSLWaContactSearch;->pending:Ljava/lang/Runnable;

    const-wide/16 v2, 0xfa

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_24
.end method

.method private show(Ljava/util/List;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "LSLWaContactSearch$Contact;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 221
    iget-object v0, p0, LSLWaContactSearch;->chips:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 222
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_31

    .line 223
    invoke-virtual {p0}, LSLWaContactSearch;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, LSLAgendaTheme;->resolve(Landroid/content/Context;Lp7b;)LSLAgendaTheme;

    move-result-object v1

    .line 224
    invoke-direct {p0}, LSLWaContactSearch;->whatsappIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 225
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1c
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_31

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, LSLWaContactSearch$Contact;

    .line 226
    new-instance v4, LSLWaContactSearch$4;

    invoke-direct {v4, p0, v0}, LSLWaContactSearch$4;-><init>(LSLWaContactSearch;LSLWaContactSearch$Contact;)V

    invoke-direct {p0, v0, v1, v2, v4}, LSLWaContactSearch;->addContactChip(LSLWaContactSearch$Contact;LSLAgendaTheme;Landroid/graphics/drawable/Drawable;Landroid/view/View$OnClickListener;)V

    goto :goto_1c

    .line 231
    :cond_31
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3d

    const/16 v0, 0x8

    :goto_39
    invoke-virtual {p0, v0}, LSLWaContactSearch;->setVisibility(I)V

    .line 232
    return-void

    .line 231
    :cond_3d
    const/4 v0, 0x0

    goto :goto_39
.end method

.method private whatsappIcon()Landroid/graphics/drawable/Drawable;
    .registers 6

    .prologue
    const/4 v0, 0x0

    .line 234
    invoke-virtual {p0}, LSLWaContactSearch;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 235
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "com.whatsapp"

    aput-object v3, v2, v0

    const/4 v3, 0x1

    const-string v4, "com.whatsapp.w4b"

    aput-object v4, v2, v3

    array-length v3, v2

    :goto_16
    if-ge v0, v3, :cond_23

    aget-object v4, v2, v0

    .line 236
    :try_start_1a
    invoke-virtual {v1, v4}, Landroid/content/pm/PackageManager;->getApplicationIcon(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    :try_end_1d
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1a .. :try_end_1d} :catch_1f
    .catch Ljava/lang/SecurityException; {:try_start_1a .. :try_end_1d} :catch_25

    move-result-object v0

    .line 239
    :goto_1e
    return-object v0

    .line 237
    :catch_1f
    move-exception v4

    .line 235
    :goto_20
    add-int/lit8 v0, v0, 0x1

    goto :goto_16

    .line 239
    :cond_23
    const/4 v0, 0x0

    goto :goto_1e

    .line 237
    :catch_25
    move-exception v4

    goto :goto_20
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .registers 3

    .prologue
    .line 86
    invoke-super {p0}, Landroid/widget/HorizontalScrollView;->onAttachedToWindow()V

    .line 87
    iget-object v0, p0, LSLWaContactSearch;->editor:Landroid/widget/EditText;

    iget-object v1, p0, LSLWaContactSearch;->watcher:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 88
    invoke-direct {p0}, LSLWaContactSearch;->schedule()V

    .line 89
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 3

    .prologue
    .line 91
    iget-object v0, p0, LSLWaContactSearch;->editor:Landroid/widget/EditText;

    iget-object v1, p0, LSLWaContactSearch;->watcher:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 92
    invoke-direct {p0}, LSLWaContactSearch;->cancel()V

    .line 93
    iget-object v0, p0, LSLWaContactSearch;->chips:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 94
    invoke-super {p0}, Landroid/widget/HorizontalScrollView;->onDetachedFromWindow()V

    .line 95
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .registers 3

    .prologue
    .line 97
    invoke-super {p0, p1}, Landroid/widget/HorizontalScrollView;->onWindowFocusChanged(Z)V

    .line 98
    if-eqz p1, :cond_e

    invoke-virtual {p0}, LSLWaContactSearch;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-direct {p0}, LSLWaContactSearch;->schedule()V

    .line 99
    :cond_e
    return-void
.end method
