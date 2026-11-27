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
    .line 45
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

    .line 61
    invoke-direct {p0, p1}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    .line 46
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, LSLWaContactSearch;->main:Landroid/os/Handler;

    .line 72
    new-instance v0, LSLWaContactSearch$1;

    invoke-direct {v0, p0}, LSLWaContactSearch$1;-><init>(LSLWaContactSearch;)V

    iput-object v0, p0, LSLWaContactSearch;->watcher:Landroid/text/TextWatcher;

    .line 62
    iput-object p2, p0, LSLWaContactSearch;->editor:Landroid/widget/EditText;

    .line 63
    invoke-virtual {p0, v2}, LSLWaContactSearch;->setHorizontalScrollBarEnabled(Z)V

    .line 64
    invoke-virtual {p0, v2}, LSLWaContactSearch;->setFillViewport(Z)V

    .line 65
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, LSLWaContactSearch;->setVisibility(I)V

    .line 66
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, LSLWaContactSearch;->chips:Landroid/widget/LinearLayout;

    .line 67
    iget-object v0, p0, LSLWaContactSearch;->chips:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 68
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

    .line 69
    iget-object v0, p0, LSLWaContactSearch;->chips:Landroid/widget/LinearLayout;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0, v1}, LSLWaContactSearch;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 70
    return-void
.end method

.method static synthetic access$000(LSLWaContactSearch;)V
    .registers 1

    .prologue
    .line 44
    invoke-direct {p0}, LSLWaContactSearch;->schedule()V

    return-void
.end method

.method static synthetic access$100(LSLWaContactSearch;)V
    .registers 1

    .prologue
    .line 44
    invoke-direct {p0}, LSLWaContactSearch;->askContacts()V

    return-void
.end method

.method static synthetic access$1000(LSLWaContactSearch;Ljava/lang/String;)V
    .registers 2

    .prologue
    .line 44
    invoke-direct {p0, p1}, LSLWaContactSearch;->openWhatsApp(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$202(LSLWaContactSearch;Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .registers 2

    .prologue
    .line 44
    iput-object p1, p0, LSLWaContactSearch;->pending:Ljava/lang/Runnable;

    return-object p1
.end method

.method static synthetic access$302(LSLWaContactSearch;Landroid/os/CancellationSignal;)Landroid/os/CancellationSignal;
    .registers 2

    .prologue
    .line 44
    iput-object p1, p0, LSLWaContactSearch;->signal:Landroid/os/CancellationSignal;

    return-object p1
.end method

.method static synthetic access$402(LSLWaContactSearch;Ljava/util/concurrent/Future;)Ljava/util/concurrent/Future;
    .registers 2

    .prologue
    .line 44
    iput-object p1, p0, LSLWaContactSearch;->query:Ljava/util/concurrent/Future;

    return-object p1
.end method

.method static synthetic access$500(LSLWaContactSearch;Ljava/lang/String;Landroid/os/CancellationSignal;)Ljava/util/List;
    .registers 4

    .prologue
    .line 44
    invoke-direct {p0, p1, p2}, LSLWaContactSearch;->findContacts(Ljava/lang/String;Landroid/os/CancellationSignal;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(LSLWaContactSearch;)I
    .registers 2

    .prologue
    .line 44
    iget v0, p0, LSLWaContactSearch;->generation:I

    return v0
.end method

.method static synthetic access$700(LSLWaContactSearch;Ljava/util/List;)V
    .registers 2

    .prologue
    .line 44
    invoke-direct {p0, p1}, LSLWaContactSearch;->show(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$800(LSLWaContactSearch;)Landroid/os/Handler;
    .registers 2

    .prologue
    .line 44
    iget-object v0, p0, LSLWaContactSearch;->main:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$900()Ljava/util/concurrent/ExecutorService;
    .registers 1

    .prologue
    .line 44
    sget-object v0, LSLWaContactSearch;->WORKER:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method private activity()Landroid/app/Activity;
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 255
    invoke-virtual {p0}, LSLWaContactSearch;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 256
    :goto_5
    instance-of v0, v1, Landroid/content/ContextWrapper;

    if-eqz v0, :cond_19

    instance-of v0, v1, Landroid/app/Activity;

    if-nez v0, :cond_19

    move-object v0, v1

    .line 257
    check-cast v0, Landroid/content/ContextWrapper;

    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    if-ne v0, v1, :cond_17

    .line 259
    :goto_16
    return-object v2

    :cond_17
    move-object v1, v0

    .line 258
    goto :goto_5

    .line 259
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

    .line 246
    new-instance v0, Landroid/widget/TextView;

    invoke-virtual {p0}, LSLWaContactSearch;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 247
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 248
    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 249
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

    .line 250
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v2, -0x1fdad7d5

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v2, 0x41a00000    # 20.0f

    invoke-direct {p0, v2}, LSLWaContactSearch;->dp(F)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 251
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 252
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v2, 0x41000000    # 8.0f

    invoke-direct {p0, v2}, LSLWaContactSearch;->dp(F)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    iget-object v2, p0, LSLWaContactSearch;->chips:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 253
    return-void
.end method

.method private addContactChip(LSLWaContactSearch$Contact;LSLAgendaTheme;Landroid/graphics/drawable/Drawable;Landroid/view/View$OnClickListener;)V
    .registers 16

    .prologue
    const/high16 v10, 0x43300000    # 176.0f

    const/high16 v9, 0x42100000    # 36.0f

    const/high16 v8, 0x41400000    # 12.0f

    const/high16 v7, 0x41000000    # 8.0f

    const/4 v6, 0x1

    .line 181
    invoke-virtual {p0}, LSLWaContactSearch;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 182
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 183
    const/4 v0, 0x0

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 184
    const/16 v0, 0x10

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 185
    invoke-direct {p0, v8}, LSLWaContactSearch;->dp(F)I

    move-result v0

    invoke-direct {p0, v7}, LSLWaContactSearch;->dp(F)I

    move-result v3

    const/high16 v4, 0x41600000    # 14.0f

    invoke-direct {p0, v4}, LSLWaContactSearch;->dp(F)I

    move-result v4

    invoke-direct {p0, v7}, LSLWaContactSearch;->dp(F)I

    move-result v5

    invoke-virtual {v2, v0, v3, v4, v5}, Landroid/widget/LinearLayout;->setPaddingRelative(IIII)V

    .line 186
    const/high16 v0, 0x42600000    # 56.0f

    invoke-direct {p0, v0}, LSLWaContactSearch;->dp(F)I

    move-result v0

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    .line 187
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 188
    iget-boolean v0, p2, LSLAgendaTheme;->isLight:Z

    if-eqz v0, :cond_164

    const v0, -0x11000001

    :goto_45
    invoke-virtual {v3, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 189
    const/high16 v0, 0x41800000    # 16.0f

    invoke-direct {p0, v0}, LSLWaContactSearch;->dp(F)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {v3, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 190
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-direct {p0, v0}, LSLWaContactSearch;->dp(F)I

    move-result v4

    iget-boolean v0, p2, LSLAgendaTheme;->isLight:Z

    if-eqz v0, :cond_169

    const v0, 0x381fa855

    :goto_5f
    invoke-virtual {v3, v4, v0}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 191
    new-instance v4, Landroid/graphics/drawable/RippleDrawable;

    iget-boolean v0, p2, LSLAgendaTheme;->isLight:Z

    if-eqz v0, :cond_16e

    const v0, 0x241fa855

    :goto_6b
    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    const/4 v5, 0x0

    invoke-direct {v4, v0, v3, v5}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 194
    if-eqz p3, :cond_173

    .line 195
    new-instance v0, Landroid/widget/ImageView;

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 196
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v3

    if-eqz v3, :cond_8f

    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p3

    :cond_8f
    invoke-virtual {v0, p3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 197
    sget-object v3, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 212
    :goto_97
    const/4 v3, 0x2

    invoke-virtual {v0, v3}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 213
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p0, v9}, LSLWaContactSearch;->dp(F)I

    move-result v4

    invoke-direct {p0, v9}, LSLWaContactSearch;->dp(F)I

    move-result v5

    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 214
    const/high16 v4, 0x41200000    # 10.0f

    invoke-direct {p0, v4}, LSLWaContactSearch;->dp(F)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 215
    invoke-virtual {v2, v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 217
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 218
    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 219
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 220
    iget-object v4, p1, LSLWaContactSearch$Contact;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 221
    iget v4, p2, LSLAgendaTheme;->textPrimary:I

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 222
    const/high16 v4, 0x41700000    # 15.0f

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 223
    sget-object v4, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v3, v4, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 224
    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 225
    sget-object v4, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 226
    invoke-direct {p0, v10}, LSLWaContactSearch;->dp(F)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 227
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 228
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 229
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "+"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v4, p1, LSLWaContactSearch$Contact;->phone:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 230
    iget v1, p2, LSLAgendaTheme;->textSecondary:I

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 231
    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setTextSize(F)V

    .line 232
    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 233
    const/4 v1, 0x3

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setTextDirection(I)V

    .line 234
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 235
    invoke-direct {p0, v10}, LSLWaContactSearch;->dp(F)I

    move-result v1

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 236
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 237
    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setImportantForAccessibility(I)V

    .line 238
    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 239
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

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 240
    invoke-virtual {v2, p4}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 241
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    const/4 v3, -0x2

    invoke-direct {v0, v1, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 242
    invoke-direct {p0, v7}, LSLWaContactSearch;->dp(F)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 243
    iget-object v1, p0, LSLWaContactSearch;->chips:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 244
    return-void

    .line 188
    :cond_164
    const v0, -0x19e4dfd8    # -1.8314E23f

    goto/16 :goto_45

    .line 190
    :cond_169
    const v0, 0x4d25d366    # 1.73880928E8f

    goto/16 :goto_5f

    .line 191
    :cond_16e
    const v0, 0x3325d366

    goto/16 :goto_6b

    .line 200
    :cond_173
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 201
    const-string v3, "WA"

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 202
    const/high16 v3, 0x41300000    # 11.0f

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 203
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v0, v3, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 204
    const/4 v3, -0x1

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 205
    const/16 v3, 0x11

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setGravity(I)V

    .line 206
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 207
    const v4, -0xed73b6

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 208
    const/high16 v4, 0x41900000    # 18.0f

    invoke-direct {p0, v4}, LSLWaContactSearch;->dp(F)I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 209
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_97
.end method

.method private askContacts()V
    .registers 5

    .prologue
    .line 262
    invoke-direct {p0}, LSLWaContactSearch;->activity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_c

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-eqz v1, :cond_d

    .line 273
    :cond_c
    :goto_c
    return-void

    .line 263
    :cond_d
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "Find WhatsApp contacts"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Search matching phone contacts on this device. WhatsApp opens only when you tap a result. Chat messages are not read."

    .line 264
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Allow"

    new-instance v3, LSLWaContactSearch$6;

    invoke-direct {v3, p0, v0}, LSLWaContactSearch$6;-><init>(LSLWaContactSearch;Landroid/app/Activity;)V

    .line 265
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "App settings"

    new-instance v3, LSLWaContactSearch$5;

    invoke-direct {v3, p0, v0}, LSLWaContactSearch$5;-><init>(LSLWaContactSearch;Landroid/app/Activity;)V

    .line 267
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Cancel"

    const/4 v2, 0x0

    .line 272
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_c
.end method

.method public static attach(Landroid/widget/EditText;Landroid/widget/LinearLayout;)V
    .registers 7

    .prologue
    .line 55
    if-eqz p0, :cond_c

    if-eqz p1, :cond_c

    const-string v0, "sl_wa_contact_search"

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_d

    .line 59
    :cond_c
    :goto_c
    return-void

    .line 56
    :cond_d
    new-instance v0, LSLWaContactSearch;

    invoke-virtual {p0}, Landroid/widget/EditText;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p0}, LSLWaContactSearch;-><init>(Landroid/content/Context;Landroid/widget/EditText;)V

    .line 57
    const-string v1, "sl_wa_contact_search"

    invoke-virtual {v0, v1}, LSLWaContactSearch;->setTag(Ljava/lang/Object;)V

    .line 58
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

    .line 93
    iget v0, p0, LSLWaContactSearch;->generation:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, LSLWaContactSearch;->generation:I

    .line 94
    iget-object v0, p0, LSLWaContactSearch;->pending:Ljava/lang/Runnable;

    if-eqz v0, :cond_14

    iget-object v0, p0, LSLWaContactSearch;->main:Landroid/os/Handler;

    iget-object v1, p0, LSLWaContactSearch;->pending:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iput-object v2, p0, LSLWaContactSearch;->pending:Ljava/lang/Runnable;

    .line 95
    :cond_14
    iget-object v0, p0, LSLWaContactSearch;->signal:Landroid/os/CancellationSignal;

    if-eqz v0, :cond_1f

    iget-object v0, p0, LSLWaContactSearch;->signal:Landroid/os/CancellationSignal;

    invoke-virtual {v0}, Landroid/os/CancellationSignal;->cancel()V

    iput-object v2, p0, LSLWaContactSearch;->signal:Landroid/os/CancellationSignal;

    .line 96
    :cond_1f
    iget-object v0, p0, LSLWaContactSearch;->query:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_2b

    iget-object v0, p0, LSLWaContactSearch;->query:Ljava/util/concurrent/Future;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    iput-object v2, p0, LSLWaContactSearch;->query:Ljava/util/concurrent/Future;

    .line 97
    :cond_2b
    return-void
.end method

.method private static country(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    .prologue
    .line 153
    :try_start_0
    const-string v0, "phone"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 154
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

    .line 157
    :goto_1e
    return-object v0

    .line 155
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

    .line 156
    :catch_36
    move-exception v0

    .line 157
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
    .line 71
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
    .registers 13
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
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 129
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 130
    new-instance v8, Ljava/util/HashSet;

    invoke-direct {v8}, Ljava/util/HashSet;-><init>()V

    .line 131
    invoke-virtual {p0}, LSLWaContactSearch;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 132
    sget-object v1, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_FILTER_URI:Landroid/net/Uri;

    invoke-static {p1}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 133
    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "display_name"

    aput-object v3, v2, v4

    const-string v3, "data1"

    aput-object v3, v2, v5

    const-string v3, "data4"

    aput-object v3, v2, v6

    .line 135
    invoke-static {v0}, LSLWaContactSearch;->country(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v9

    .line 136
    :try_start_32
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v5, "display_name COLLATE LOCALIZED ASC"

    move-object v6, p2

    invoke-virtual/range {v0 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Landroid/os/CancellationSignal;)Landroid/database/Cursor;
    :try_end_3e
    .catch Ljava/lang/RuntimeException; {:try_start_32 .. :try_end_3e} :catch_a1

    move-result-object v1

    .line 139
    :cond_3f
    :goto_3f
    if-eqz v1, :cond_a3

    :try_start_41
    invoke-virtual {p2}, Landroid/os/CancellationSignal;->isCanceled()Z

    move-result v0

    if-nez v0, :cond_a3

    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_a3

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v0

    const/4 v2, 0x5

    if-ge v0, v2, :cond_a3

    .line 140
    const/4 v0, 0x0

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v0, 0x1

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 141
    invoke-static {v3}, LSLWaPhone;->plainNumber(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3f

    .line 142
    const/4 v0, 0x2

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, LSLWaPhone;->digits(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 143
    if-nez v0, :cond_73

    invoke-static {v3}, LSLWaPhone;->digits(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 144
    :cond_73
    if-nez v0, :cond_83

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_83

    .line 145
    invoke-static {v3, v9}, Landroid/telephony/PhoneNumberUtils;->formatNumberToE164(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, LSLWaPhone;->digits(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 146
    :cond_83
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3f

    if-eqz v0, :cond_3f

    invoke-virtual {v8, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3f

    new-instance v3, LSLWaContactSearch$Contact;

    invoke-direct {v3, v2, v0}, LSLWaContactSearch$Contact;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v7, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_99
    .catch Ljava/lang/Throwable; {:try_start_41 .. :try_end_99} :catch_9a
    .catch Ljava/lang/RuntimeException; {:try_start_41 .. :try_end_99} :catch_a1

    goto :goto_3f

    .line 136
    :catch_9a
    move-exception v0

    if-eqz v1, :cond_a0

    :try_start_9d
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_a0
    .catch Ljava/lang/Throwable; {:try_start_9d .. :try_end_a0} :catch_a9
    .catch Ljava/lang/RuntimeException; {:try_start_9d .. :try_end_a0} :catch_a1

    :cond_a0
    :goto_a0
    :try_start_a0
    throw v0

    .line 148
    :catch_a1
    move-exception v0

    .line 149
    :cond_a2
    :goto_a2
    return-object v7

    .line 148
    :cond_a3
    if-eqz v1, :cond_a2

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto :goto_a2

    .line 136
    :catch_a9
    move-exception v1

    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_ad
    .catch Ljava/lang/RuntimeException; {:try_start_a0 .. :try_end_ad} :catch_a1

    goto :goto_a0
.end method

.method private openWhatsApp(Ljava/lang/String;)V
    .registers 11

    .prologue
    const/4 v8, 0x1

    const/4 v0, 0x0

    .line 275
    invoke-virtual {p0}, LSLWaContactSearch;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 276
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

    .line 277
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

    .line 278
    new-instance v6, Landroid/content/Intent;

    const-string v7, "android.intent.action.VIEW"

    invoke-direct {v6, v7, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v6, v5}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v5

    .line 279
    instance-of v6, v1, Landroid/app/Activity;

    if-nez v6, :cond_41

    const/high16 v6, 0x10000000

    invoke-virtual {v5, v6}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 280
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

    .line 284
    :goto_4e
    return-void

    .line 281
    :catch_4f
    move-exception v5

    .line 277
    :cond_50
    :goto_50
    add-int/lit8 v0, v0, 0x1

    goto :goto_29

    .line 283
    :cond_53
    const-string v0, "WhatsApp is not available on this device"

    invoke-static {v1, v0, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_4e

    .line 281
    :catch_5d
    move-exception v5

    goto :goto_50
.end method

.method private schedule()V
    .registers 5

    .prologue
    .line 99
    invoke-direct {p0}, LSLWaContactSearch;->cancel()V

    .line 100
    iget-object v0, p0, LSLWaContactSearch;->chips:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 101
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, LSLWaContactSearch;->setVisibility(I)V

    .line 102
    iget-object v0, p0, LSLWaContactSearch;->editor:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    if-nez v0, :cond_25

    const-string v0, ""

    .line 103
    :goto_17
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x2

    if-lt v1, v2, :cond_24

    invoke-virtual {p0}, LSLWaContactSearch;->isAttachedToWindow()Z

    move-result v1

    if-nez v1, :cond_34

    .line 123
    :cond_24
    :goto_24
    return-void

    .line 102
    :cond_25
    iget-object v0, p0, LSLWaContactSearch;->editor:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    goto :goto_17

    .line 104
    :cond_34
    invoke-virtual {p0}, LSLWaContactSearch;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "android.permission.READ_CONTACTS"

    invoke-virtual {v1, v2}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_4f

    .line 105
    const-string v0, "Allow contacts for WhatsApp"

    new-instance v1, LSLWaContactSearch$2;

    invoke-direct {v1, p0}, LSLWaContactSearch$2;-><init>(LSLWaContactSearch;)V

    invoke-direct {p0, v0, v1}, LSLWaContactSearch;->addChip(Ljava/lang/String;Landroid/view/View$OnClickListener;)V

    .line 106
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, LSLWaContactSearch;->setVisibility(I)V

    goto :goto_24

    .line 109
    :cond_4f
    iget v1, p0, LSLWaContactSearch;->generation:I

    .line 110
    new-instance v2, LSLWaContactSearch$3;

    invoke-direct {v2, p0, v0, v1}, LSLWaContactSearch$3;-><init>(LSLWaContactSearch;Ljava/lang/String;I)V

    iput-object v2, p0, LSLWaContactSearch;->pending:Ljava/lang/Runnable;

    .line 122
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
    .line 160
    iget-object v0, p0, LSLWaContactSearch;->chips:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 161
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_31

    .line 162
    invoke-virtual {p0}, LSLWaContactSearch;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, LSLAgendaTheme;->resolve(Landroid/content/Context;Lp7b;)LSLAgendaTheme;

    move-result-object v1

    .line 163
    invoke-direct {p0}, LSLWaContactSearch;->whatsappIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 164
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1c
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_31

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, LSLWaContactSearch$Contact;

    .line 165
    new-instance v4, LSLWaContactSearch$4;

    invoke-direct {v4, p0, v0}, LSLWaContactSearch$4;-><init>(LSLWaContactSearch;LSLWaContactSearch$Contact;)V

    invoke-direct {p0, v0, v1, v2, v4}, LSLWaContactSearch;->addContactChip(LSLWaContactSearch$Contact;LSLAgendaTheme;Landroid/graphics/drawable/Drawable;Landroid/view/View$OnClickListener;)V

    goto :goto_1c

    .line 170
    :cond_31
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3d

    const/16 v0, 0x8

    :goto_39
    invoke-virtual {p0, v0}, LSLWaContactSearch;->setVisibility(I)V

    .line 171
    return-void

    .line 170
    :cond_3d
    const/4 v0, 0x0

    goto :goto_39
.end method

.method private whatsappIcon()Landroid/graphics/drawable/Drawable;
    .registers 6

    .prologue
    const/4 v0, 0x0

    .line 173
    invoke-virtual {p0}, LSLWaContactSearch;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 174
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

    .line 175
    :try_start_1a
    invoke-virtual {v1, v4}, Landroid/content/pm/PackageManager;->getApplicationIcon(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    :try_end_1d
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1a .. :try_end_1d} :catch_1f
    .catch Ljava/lang/SecurityException; {:try_start_1a .. :try_end_1d} :catch_25

    move-result-object v0

    .line 178
    :goto_1e
    return-object v0

    .line 176
    :catch_1f
    move-exception v4

    .line 174
    :goto_20
    add-int/lit8 v0, v0, 0x1

    goto :goto_16

    .line 178
    :cond_23
    const/4 v0, 0x0

    goto :goto_1e

    .line 176
    :catch_25
    move-exception v4

    goto :goto_20
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .registers 3

    .prologue
    .line 78
    invoke-super {p0}, Landroid/widget/HorizontalScrollView;->onAttachedToWindow()V

    .line 79
    iget-object v0, p0, LSLWaContactSearch;->editor:Landroid/widget/EditText;

    iget-object v1, p0, LSLWaContactSearch;->watcher:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 80
    invoke-direct {p0}, LSLWaContactSearch;->schedule()V

    .line 81
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 3

    .prologue
    .line 83
    iget-object v0, p0, LSLWaContactSearch;->editor:Landroid/widget/EditText;

    iget-object v1, p0, LSLWaContactSearch;->watcher:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 84
    invoke-direct {p0}, LSLWaContactSearch;->cancel()V

    .line 85
    iget-object v0, p0, LSLWaContactSearch;->chips:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 86
    invoke-super {p0}, Landroid/widget/HorizontalScrollView;->onDetachedFromWindow()V

    .line 87
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .registers 3

    .prologue
    .line 89
    invoke-super {p0, p1}, Landroid/widget/HorizontalScrollView;->onWindowFocusChanged(Z)V

    .line 90
    if-eqz p1, :cond_e

    invoke-virtual {p0}, LSLWaContactSearch;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-direct {p0}, LSLWaContactSearch;->schedule()V

    .line 91
    :cond_e
    return-void
.end method
