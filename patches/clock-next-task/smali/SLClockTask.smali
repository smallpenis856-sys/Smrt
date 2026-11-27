.class public final LSLClockTask;
.super Ljava/lang/Object;
.source "SLClockTask.java"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# instance fields
.field private final datePaint:Landroid/text/TextPaint;

.field private day:Ljava/lang/String;

.field private details:Ljava/lang/String;

.field private generation:I

.field private final main:Landroid/os/Handler;

.field private final prefs:Landroid/content/SharedPreferences;

.field private stopped:Z

.field private title:Ljava/lang/String;

.field private final titlePaint:Landroid/text/TextPaint;

.field private final view:Landroid/view/View;

.field private final worker:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 5

    .prologue
    const/4 v2, 0x3

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, LSLClockTask;->main:Landroid/os/Handler;

    .line 22
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, LSLClockTask;->worker:Ljava/util/concurrent/ExecutorService;

    .line 23
    new-instance v0, Landroid/text/TextPaint;

    invoke-direct {v0, v2}, Landroid/text/TextPaint;-><init>(I)V

    iput-object v0, p0, LSLClockTask;->titlePaint:Landroid/text/TextPaint;

    new-instance v0, Landroid/text/TextPaint;

    invoke-direct {v0, v2}, Landroid/text/TextPaint;-><init>(I)V

    iput-object v0, p0, LSLClockTask;->datePaint:Landroid/text/TextPaint;

    .line 26
    const-string v0, ""

    iput-object v0, p0, LSLClockTask;->day:Ljava/lang/String;

    const-string v0, "No upcoming tasks"

    iput-object v0, p0, LSLClockTask;->title:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, LSLClockTask;->details:Ljava/lang/String;

    .line 29
    iput-object p1, p0, LSLClockTask;->view:Landroid/view/View;

    .line 30
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "sl_agenda_panel_v1"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, LSLClockTask;->prefs:Landroid/content/SharedPreferences;

    .line 31
    iget-object v0, p0, LSLClockTask;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 32
    invoke-direct {p0}, LSLClockTask;->refresh()V

    .line 33
    return-void
.end method

.method static synthetic access$000(LSLClockTask;)Landroid/content/SharedPreferences;
    .registers 2

    .prologue
    .line 18
    iget-object v0, p0, LSLClockTask;->prefs:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method static synthetic access$100(LSLClockTask;)Z
    .registers 2

    .prologue
    .line 18
    iget-boolean v0, p0, LSLClockTask;->stopped:Z

    return v0
.end method

.method static synthetic access$200(LSLClockTask;)I
    .registers 2

    .prologue
    .line 18
    iget v0, p0, LSLClockTask;->generation:I

    return v0
.end method

.method static synthetic access$302(LSLClockTask;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .prologue
    .line 18
    iput-object p1, p0, LSLClockTask;->title:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$402(LSLClockTask;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .prologue
    .line 18
    iput-object p1, p0, LSLClockTask;->details:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$500(LSLClockTask;)Landroid/view/View;
    .registers 2

    .prologue
    .line 18
    iget-object v0, p0, LSLClockTask;->view:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$600(LSLClockTask;)Landroid/os/Handler;
    .registers 2

    .prologue
    .line 18
    iget-object v0, p0, LSLClockTask;->main:Landroid/os/Handler;

    return-object v0
.end method

.method private static key(Ljava/util/Calendar;)Ljava/lang/String;
    .registers 8

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    .line 49
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%04d-%02d-%02d"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p0, v5}, Ljava/util/Calendar;->get(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p0, v6}, Ljava/util/Calendar;->get(I)I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v5

    const/4 v3, 0x5

    invoke-virtual {p0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v6

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private refresh()V
    .registers 5

    .prologue
    .line 52
    iget-boolean v0, p0, LSLClockTask;->stopped:Z

    if-eqz v0, :cond_5

    .line 81
    :goto_4
    return-void

    .line 53
    :cond_5
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-static {v0}, LSLClockTask;->key(Ljava/util/Calendar;)Ljava/lang/String;

    move-result-object v0

    .line 54
    iput-object v0, p0, LSLClockTask;->day:Ljava/lang/String;

    .line 55
    iget v1, p0, LSLClockTask;->generation:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, LSLClockTask;->generation:I

    .line 56
    iget-object v2, p0, LSLClockTask;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v3, LSLClockTask$1;

    invoke-direct {v3, p0, v0, v1}, LSLClockTask$1;-><init>(LSLClockTask;Ljava/lang/String;I)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_4
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;IIFLandroid/graphics/Paint;Landroid/graphics/Paint;)V
    .registers 16

    .prologue
    const/16 v8, 0x20

    const/high16 v7, 0x41000000    # 8.0f

    const v6, 0x3f5c28f6    # 0.86f

    .line 83
    iget-object v0, p0, LSLClockTask;->view:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v2, v0, Landroid/util/DisplayMetrics;->density:F

    .line 84
    int-to-float v0, p2

    const v1, 0x3d6147ae    # 0.055f

    mul-float/2addr v0, v1

    invoke-static {p4, v0}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 85
    const/high16 v0, 0x41580000    # 13.5f

    mul-float/2addr v0, v2

    const/high16 v1, 0x41980000    # 19.0f

    mul-float/2addr v1, v2

    int-to-float v4, p2

    const v5, 0x3d4ccccd    # 0.05f

    mul-float/2addr v4, v5

    invoke-static {v1, v4}, Ljava/lang/Math;->min(FF)F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 86
    iget-object v1, p0, LSLClockTask;->titlePaint:Landroid/text/TextPaint;

    invoke-virtual {v1, p5}, Landroid/text/TextPaint;->set(Landroid/graphics/Paint;)V

    iget-object v1, p0, LSLClockTask;->datePaint:Landroid/text/TextPaint;

    invoke-virtual {v1, p6}, Landroid/text/TextPaint;->set(Landroid/graphics/Paint;)V

    .line 87
    iget-object v1, p0, LSLClockTask;->titlePaint:Landroid/text/TextPaint;

    invoke-virtual {v1, v0}, Landroid/text/TextPaint;->setTextSize(F)V

    iget-object v1, p0, LSLClockTask;->datePaint:Landroid/text/TextPaint;

    mul-float v4, v0, v6

    invoke-virtual {v1, v4}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 88
    int-to-float v1, p3

    mul-float v4, v7, v2

    sub-float/2addr v1, v4

    .line 89
    iget-object v4, p0, LSLClockTask;->details:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_95

    move v0, v1

    .line 90
    :goto_52
    const/4 v4, 0x0

    int-to-float v5, p2

    sub-float/2addr v5, v3

    mul-float/2addr v2, v7

    sub-float v2, v5, v2

    invoke-static {v4, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    .line 91
    iget-object v4, p0, LSLClockTask;->title:Ljava/lang/String;

    const/16 v5, 0xa

    invoke-virtual {v4, v5, v8}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0xd

    invoke-virtual {v4, v5, v8}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, LSLClockTask;->titlePaint:Landroid/text/TextPaint;

    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-static {v4, v5, v2, v6}, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;

    move-result-object v4

    .line 92
    iget-object v5, p0, LSLClockTask;->details:Ljava/lang/String;

    iget-object v6, p0, LSLClockTask;->datePaint:Landroid/text/TextPaint;

    sget-object v7, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-static {v5, v6, v2, v7}, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;

    move-result-object v2

    .line 93
    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, LSLClockTask;->titlePaint:Landroid/text/TextPaint;

    invoke-virtual {p1, v4, v3, v0, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 94
    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-lez v0, :cond_94

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, LSLClockTask;->datePaint:Landroid/text/TextPaint;

    invoke-virtual {p1, v0, v3, v1, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 95
    :cond_94
    return-void

    .line 89
    :cond_95
    mul-float/2addr v0, v6

    const v4, 0x3f9eb852    # 1.24f

    mul-float/2addr v0, v4

    sub-float v0, v1, v0

    goto :goto_52
.end method

.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 4

    .prologue
    .line 46
    if-eqz p2, :cond_a

    const-string v0, "items_json"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    :cond_a
    invoke-direct {p0}, LSLClockTask;->refresh()V

    .line 47
    :cond_d
    return-void
.end method

.method public stop()V
    .registers 3

    .prologue
    .line 35
    const/4 v0, 0x1

    iput-boolean v0, p0, LSLClockTask;->stopped:Z

    .line 36
    iget v0, p0, LSLClockTask;->generation:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, LSLClockTask;->generation:I

    .line 37
    iget-object v0, p0, LSLClockTask;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 38
    iget-object v0, p0, LSLClockTask;->worker:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 39
    iget-object v0, p0, LSLClockTask;->main:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 40
    return-void
.end method

.method public tick()V
    .registers 3

    .prologue
    .line 42
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-static {v0}, LSLClockTask;->key(Ljava/util/Calendar;)Ljava/lang/String;

    move-result-object v0

    .line 43
    iget-object v1, p0, LSLClockTask;->day:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_13

    invoke-direct {p0}, LSLClockTask;->refresh()V

    .line 44
    :cond_13
    return-void
.end method
