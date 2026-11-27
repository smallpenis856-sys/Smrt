.class public final LSLGifIcons;
.super Ljava/lang/Object;
.source "SLGifIcons.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LSLGifIcons$GifDrawable;
    }
.end annotation


# static fields
.field private static final MAX_BYTES:I = 0x100000

.field private static final MAX_TOTAL:I = 0x1000000

.field private static final PREFIX:Ljava/lang/String; = "gif_icon_v1_"

.field private static final REQUEST:I = 0x7461

.field private static final STORE:Ljava/lang/String; = "sl_mod_settings"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(I)Ljava/lang/String;
    .locals 1

    .prologue
    .line 25
    invoke-static {p0}, LSLGifIcons;->key(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .locals 1

    .prologue
    .line 25
    invoke-static {p0}, LSLGifIcons;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Landroid/view/View;)V
    .locals 0

    .prologue
    .line 25
    invoke-static {p0}, LSLGifIcons;->refreshView(Landroid/view/View;)V

    return-void
.end method

.method public static bind(Landroid/view/View;ILandroid/widget/ImageView;)Z
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 90
    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, LSLGifIcons;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-static {p1}, LSLGifIcons;->key(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 91
    invoke-virtual {p2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    instance-of v3, v3, LSLGifIcons$GifDrawable;

    if-eqz v3, :cond_0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {p2, v3, v4}, Landroid/widget/ImageView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 92
    :cond_0
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    const v4, 0x15555d

    if-le v3, v4, :cond_2

    .line 100
    :cond_1
    :goto_0
    return v0

    .line 93
    :cond_2
    const/4 v3, 0x2

    invoke-static {v2, v3}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v2

    .line 94
    invoke-static {v2}, LSLGifIcons;->valid([B)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 95
    const/4 v3, 0x0

    array-length v4, v2

    invoke-static {v2, v3, v4}, Landroid/graphics/Movie;->decodeByteArray([BII)Landroid/graphics/Movie;

    move-result-object v2

    .line 96
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Landroid/graphics/Movie;->duration()I

    move-result v3

    if-lez v3, :cond_1

    .line 97
    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-virtual {p2, v3, v4}, Landroid/widget/ImageView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 98
    new-instance v3, LSLGifIcons$GifDrawable;

    invoke-direct {v3, p0, v2}, LSLGifIcons$GifDrawable;-><init>(Landroid/view/View;Landroid/graphics/Movie;)V

    invoke-virtual {p2, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v1

    .line 99
    goto :goto_0

    .line 100
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private static key(I)Ljava/lang/String;
    .locals 2

    .prologue
    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "gif_icon_v1_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .locals 2

    .prologue
    .line 29
    const-string v0, "sl_mod_settings"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method public static prompt(Landroid/app/Activity;I)V
    .locals 3

    .prologue
    .line 33
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "sl_gif_prompted"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 52
    :goto_0
    return-void

    .line 34
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "sl_gif_prompted"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 35
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    new-instance v1, LSLGifIcons$1;

    invoke-direct {v1, p0, p1}, LSLGifIcons$1;-><init>(Landroid/app/Activity;I)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public static refresh(Landroid/app/Activity;)V
    .locals 2

    .prologue
    .line 103
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    new-instance v1, LSLGifIcons$3;

    invoke-direct {v1, p0}, LSLGifIcons$3;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 104
    return-void
.end method

.method private static refreshView(Landroid/view/View;)V
    .locals 7

    .prologue
    const/4 v3, 0x0

    .line 108
    :try_start_0
    const-string v1, "ginlemon.flower.launchable.view.LaunchableView"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    .line 109
    invoke-virtual {v5, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 110
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    .line 111
    move-object v0, p0

    check-cast v0, Landroid/view/ViewGroup;

    move-object v1, v0

    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 112
    instance-of v4, v1, Landroid/widget/ImageView;

    if-eqz v4, :cond_3

    check-cast v1, Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    instance-of v1, v1, LSLGifIcons$GifDrawable;

    if-eqz v1, :cond_3

    const/4 v1, 0x1

    move v4, v1

    .line 113
    :goto_0
    instance-of v1, v2, Ljava/lang/Integer;

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, LSLGifIcons;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v6

    move-object v0, v2

    check-cast v0, Ljava/lang/Integer;

    move-object v1, v0

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v1}, LSLGifIcons;->key(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v6, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    if-eqz v4, :cond_2

    :cond_1
    const-string v1, "n"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v5, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 118
    :cond_2
    return-void

    :cond_3
    move v4, v3

    .line 112
    goto :goto_0

    .line 116
    :catch_0
    move-exception v1

    .line 117
    :cond_4
    :goto_1
    instance-of v1, p0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_2

    check-cast p0, Landroid/view/ViewGroup;

    move v1, v3

    :goto_2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_2

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, LSLGifIcons;->refreshView(Landroid/view/View;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 116
    :catch_1
    move-exception v1

    goto :goto_1
.end method

.method public static result(Landroid/app/Activity;IIILandroid/content/Intent;)Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    .line 55
    const/16 v1, 0x7461

    if-eq p2, v1, :cond_1

    const/4 v0, 0x0

    .line 81
    :cond_0
    :goto_0
    return v0

    .line 56
    :cond_1
    const/4 v1, -0x1

    if-ne p3, v1, :cond_0

    if-eqz p4, :cond_0

    invoke-virtual {p4}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 57
    invoke-virtual {p4}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    .line 58
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, LSLGifIcons$2;

    invoke-direct {v3, p0, v1, p1}, LSLGifIcons$2;-><init>(Landroid/app/Activity;Landroid/net/Uri;I)V

    const-string v1, "GIF icon import"

    invoke-direct {v2, v3, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 80
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method static valid([B)Z
    .locals 6

    .prologue
    const/16 v5, 0x200

    const/4 v4, 0x4

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 84
    array-length v2, p0

    const/16 v3, 0xd

    if-lt v2, v3, :cond_1

    array-length v2, p0

    const/high16 v3, 0x100000

    if-gt v2, v3, :cond_1

    aget-byte v2, p0, v1

    const/16 v3, 0x47

    if-ne v2, v3, :cond_1

    aget-byte v2, p0, v0

    const/16 v3, 0x49

    if-ne v2, v3, :cond_1

    const/4 v2, 0x2

    aget-byte v2, p0, v2

    const/16 v3, 0x46

    if-ne v2, v3, :cond_1

    const/4 v2, 0x3

    aget-byte v2, p0, v2

    const/16 v3, 0x38

    if-ne v2, v3, :cond_1

    aget-byte v2, p0, v4

    const/16 v3, 0x37

    if-eq v2, v3, :cond_0

    aget-byte v2, p0, v4

    const/16 v3, 0x39

    if-ne v2, v3, :cond_1

    :cond_0
    const/4 v2, 0x5

    aget-byte v2, p0, v2

    const/16 v3, 0x61

    if-eq v2, v3, :cond_3

    :cond_1
    move v0, v1

    .line 86
    :cond_2
    :goto_0
    return v0

    .line 85
    :cond_3
    const/4 v2, 0x6

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    const/4 v3, 0x7

    aget-byte v3, p0, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x8

    or-int/2addr v2, v3

    const/16 v3, 0x8

    aget-byte v3, p0, v3

    and-int/lit16 v3, v3, 0xff

    const/16 v4, 0x9

    aget-byte v4, p0, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x8

    or-int/2addr v3, v4

    .line 86
    if-lez v2, :cond_4

    if-lez v3, :cond_4

    if-gt v2, v5, :cond_4

    if-le v3, v5, :cond_2

    :cond_4
    move v0, v1

    goto :goto_0
.end method
