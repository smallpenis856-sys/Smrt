.class public final LSLGifIcons;
.super Ljava/lang/Object;
.source "SLGifIcons.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LSLGifIcons$GifDrawable;,
        LSLGifIcons$Style;
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
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(I)Ljava/lang/String;
    .locals 1

    .prologue
    .line 33
    invoke-static {p0}, LSLGifIcons;->sizeKey(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Landroid/content/SharedPreferences;Ljava/lang/String;I)I
    .locals 1

    .prologue
    .line 33
    invoke-static {p0, p1, p2}, LSLGifIcons;->getInt(Landroid/content/SharedPreferences;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method static synthetic access$200(I)Ljava/lang/String;
    .locals 1

    .prologue
    .line 33
    invoke-static {p0}, LSLGifIcons;->modeKey(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(I)Ljava/lang/String;
    .locals 1

    .prologue
    .line 33
    invoke-static {p0}, LSLGifIcons;->shapeKey(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(I)Ljava/lang/String;
    .locals 1

    .prologue
    .line 33
    invoke-static {p0}, LSLGifIcons;->key(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .locals 1

    .prologue
    .line 33
    invoke-static {p0}, LSLGifIcons;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Landroid/app/Activity;I)V
    .locals 0

    .prologue
    .line 33
    invoke-static {p0, p1}, LSLGifIcons;->adjust(Landroid/app/Activity;I)V

    return-void
.end method

.method static synthetic access$700(Landroid/content/Context;I)Z
    .locals 1

    .prologue
    .line 33
    invoke-static {p0, p1}, LSLGifIcons;->remove(Landroid/content/Context;I)Z

    move-result v0

    return v0
.end method

.method static synthetic access$800(Landroid/view/View;)V
    .locals 0

    .prologue
    .line 33
    invoke-static {p0}, LSLGifIcons;->refreshView(Landroid/view/View;)V

    return-void
.end method

.method private static adjust(Landroid/app/Activity;I)V
    .locals 9

    .prologue
    const/4 v8, 0x1

    .line 163
    :try_start_0
    invoke-static {p0}, LSLGifIcons;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-static {p1}, LSLGifIcons;->key(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 164
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const v2, 0x15555d

    if-le v1, v2, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 203
    :catch_0
    move-exception v0

    const-string v0, "Could not open GIF options"

    invoke-static {p0, v0, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 204
    :goto_0
    return-void

    .line 165
    :cond_1
    const/4 v1, 0x2

    :try_start_1
    invoke-static {v0, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v0

    .line 166
    invoke-static {v0}, LSLGifIcons;->valid([B)Z

    move-result v1

    if-nez v1, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 167
    :cond_2
    const/4 v1, 0x0

    array-length v2, v0

    invoke-static {v0, v1, v2}, Landroid/graphics/Movie;->decodeByteArray([BII)Landroid/graphics/Movie;

    move-result-object v0

    .line 168
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/graphics/Movie;->duration()I

    move-result v1

    if-lez v1, :cond_3

    invoke-virtual {v0}, Landroid/graphics/Movie;->width()I

    move-result v1

    if-lez v1, :cond_3

    invoke-virtual {v0}, Landroid/graphics/Movie;->height()I

    move-result v1

    if-gtz v1, :cond_4

    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 169
    :cond_4
    new-instance v4, LSLGifIcons$Style;

    invoke-static {p0}, LSLGifIcons;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-direct {v4, v1, p1}, LSLGifIcons$Style;-><init>(Landroid/content/SharedPreferences;I)V

    .line 170
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 171
    const/high16 v2, 0x41a00000    # 20.0f

    invoke-static {p0, v2}, LSLGifIcons;->dp(Landroid/content/Context;F)I

    move-result v2

    const/high16 v3, 0x40c00000    # 6.0f

    invoke-static {p0, v3}, LSLGifIcons;->dp(Landroid/content/Context;F)I

    move-result v3

    const/4 v5, 0x0

    invoke-virtual {v1, v2, v3, v2, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 172
    new-instance v2, Landroid/widget/ImageView;

    invoke-direct {v2, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v3, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 173
    const/4 v3, 0x1

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v5}, Landroid/widget/ImageView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 174
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x42c00000    # 96.0f

    invoke-static {p0, v5}, LSLGifIcons;->dp(Landroid/content/Context;F)I

    move-result v5

    const/high16 v6, 0x42c00000    # 96.0f

    invoke-static {p0, v6}, LSLGifIcons;->dp(Landroid/content/Context;F)I

    move-result v6

    invoke-direct {v3, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v5, 0x1

    iput v5, v3, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 175
    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 176
    new-instance v3, LSLGifIcons$GifDrawable;

    const/4 v5, 0x1

    invoke-direct {v3, v2, v0, v4, v5}, LSLGifIcons$GifDrawable;-><init>(Landroid/view/View;Landroid/graphics/Movie;LSLGifIcons$Style;Z)V

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 177
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Size: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, v4, LSLGifIcons$Style;->size:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "%"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, LSLGifIcons;->label(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 178
    new-instance v5, Landroid/widget/SeekBar;

    invoke-direct {v5, p0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    const-string v2, "GIF icon size, 50 to 100 percent"

    invoke-virtual {v5, v2}, Landroid/widget/SeekBar;->setContentDescription(Ljava/lang/CharSequence;)V

    const/16 v2, 0x32

    invoke-virtual {v5, v2}, Landroid/widget/SeekBar;->setMax(I)V

    iget v2, v4, LSLGifIcons$Style;->size:I

    add-int/lit8 v2, v2, -0x32

    invoke-virtual {v5, v2}, Landroid/widget/SeekBar;->setProgress(I)V

    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 179
    new-instance v2, LSLGifIcons$4;

    invoke-direct {v2, v4, v0, v3}, LSLGifIcons$4;-><init>(LSLGifIcons$Style;Landroid/widget/TextView;LSLGifIcons$GifDrawable;)V

    invoke-virtual {v5, v2}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 183
    const-string v0, "Image fit"

    invoke-static {p0, v0}, LSLGifIcons;->label(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 184
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v6, "Fit"

    aput-object v6, v0, v2

    const/4 v2, 0x1

    const-string v6, "Crop"

    aput-object v6, v0, v2

    iget v2, v4, LSLGifIcons$Style;->mode:I

    const/4 v6, 0x1

    invoke-static {p0, v0, v2, v6}, LSLGifIcons;->group(Landroid/app/Activity;[Ljava/lang/String;IZ)Landroid/widget/RadioGroup;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 185
    new-instance v0, LSLGifIcons$5;

    invoke-direct {v0, v4, v3}, LSLGifIcons$5;-><init>(LSLGifIcons$Style;LSLGifIcons$GifDrawable;)V

    invoke-virtual {v6, v0}, Landroid/widget/RadioGroup;->setOnCheckedChangeListener(Landroid/widget/RadioGroup$OnCheckedChangeListener;)V

    .line 186
    const-string v0, "Shape"

    invoke-static {p0, v0}, LSLGifIcons;->label(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 187
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v7, "Rounded"

    aput-object v7, v0, v2

    const/4 v2, 0x1

    const-string v7, "Circle"

    aput-object v7, v0, v2

    const/4 v2, 0x2

    const-string v7, "Square"

    aput-object v7, v0, v2

    iget v2, v4, LSLGifIcons$Style;->shape:I

    const/4 v7, 0x0

    invoke-static {p0, v0, v2, v7}, LSLGifIcons;->group(Landroid/app/Activity;[Ljava/lang/String;IZ)Landroid/widget/RadioGroup;

    move-result-object v7

    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 188
    new-instance v0, LSLGifIcons$6;

    invoke-direct {v0, v4, v3}, LSLGifIcons$6;-><init>(LSLGifIcons$Style;LSLGifIcons$GifDrawable;)V

    invoke-virtual {v7, v0}, Landroid/widget/RadioGroup;->setOnCheckedChangeListener(Landroid/widget/RadioGroup$OnCheckedChangeListener;)V

    .line 189
    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 190
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "Adjust GIF icon"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Save"

    const/4 v2, 0x0

    .line 191
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Cancel"

    new-instance v2, LSLGifIcons$8;

    invoke-direct {v2, p0}, LSLGifIcons$8;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Reset"

    const/4 v2, 0x0

    .line 192
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, LSLGifIcons$7;

    invoke-direct {v1, p0}, LSLGifIcons$7;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 193
    new-instance v0, LSLGifIcons$9;

    move-object v2, p0

    move v3, p1

    invoke-direct/range {v0 .. v7}, LSLGifIcons$9;-><init>(Landroid/app/AlertDialog;Landroid/app/Activity;ILSLGifIcons$Style;Landroid/widget/SeekBar;Landroid/widget/RadioGroup;Landroid/widget/RadioGroup;)V

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 202
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method public static bind(Landroid/view/View;ILandroid/widget/ImageView;)Z
    .locals 6

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 120
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

    .line 121
    invoke-virtual {p2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    instance-of v3, v3, LSLGifIcons$GifDrawable;

    if-eqz v3, :cond_0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {p2, v3, v4}, Landroid/widget/ImageView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 122
    :cond_0
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    const v4, 0x15555d

    if-le v3, v4, :cond_2

    .line 130
    :cond_1
    :goto_0
    return v0

    .line 123
    :cond_2
    const/4 v3, 0x2

    invoke-static {v2, v3}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v2

    .line 124
    invoke-static {v2}, LSLGifIcons;->valid([B)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 125
    const/4 v3, 0x0

    array-length v4, v2

    invoke-static {v2, v3, v4}, Landroid/graphics/Movie;->decodeByteArray([BII)Landroid/graphics/Movie;

    move-result-object v2

    .line 126
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Landroid/graphics/Movie;->duration()I

    move-result v3

    if-lez v3, :cond_1

    .line 127
    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-virtual {p2, v3, v4}, Landroid/widget/ImageView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 128
    new-instance v3, LSLGifIcons$GifDrawable;

    new-instance v4, LSLGifIcons$Style;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, LSLGifIcons;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    invoke-direct {v4, v5, p1}, LSLGifIcons$Style;-><init>(Landroid/content/SharedPreferences;I)V

    const/4 v5, 0x0

    invoke-direct {v3, p0, v2, v4, v5}, LSLGifIcons$GifDrawable;-><init>(Landroid/view/View;Landroid/graphics/Movie;LSLGifIcons$Style;Z)V

    invoke-virtual {p2, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v1

    .line 129
    goto :goto_0

    .line 130
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private static dp(Landroid/content/Context;F)I
    .locals 2

    .prologue
    .line 149
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v0, p1

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method private static getInt(Landroid/content/SharedPreferences;Ljava/lang/String;I)I
    .locals 1

    .prologue
    .line 46
    :try_start_0
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    move-result p2

    :goto_0
    return p2

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private static group(Landroid/app/Activity;[Ljava/lang/String;IZ)Landroid/widget/RadioGroup;
    .locals 7

    .prologue
    const/4 v6, -0x2

    const/4 v1, 0x0

    .line 154
    new-instance v3, Landroid/widget/RadioGroup;

    invoke-direct {v3, p0}, Landroid/widget/RadioGroup;-><init>(Landroid/content/Context;)V

    if-eqz p3, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {v3, v0}, Landroid/widget/RadioGroup;->setOrientation(I)V

    move v0, v1

    .line 155
    :goto_1
    array-length v2, p1

    if-ge v0, v2, :cond_2

    .line 156
    new-instance v4, Landroid/widget/RadioButton;

    invoke-direct {v4, p0}, Landroid/widget/RadioButton;-><init>(Landroid/content/Context;)V

    aget-object v2, p1, v0

    invoke-virtual {v4, v2}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    invoke-static {}, Landroid/view/View;->generateViewId()I

    move-result v2

    invoke-virtual {v4, v2}, Landroid/widget/RadioButton;->setId(I)V

    .line 157
    if-eqz p3, :cond_1

    new-instance v2, Landroid/widget/RadioGroup$LayoutParams;

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v2, v1, v6, v5}, Landroid/widget/RadioGroup$LayoutParams;-><init>(IIF)V

    :goto_2
    invoke-virtual {v3, v4, v2}, Landroid/widget/RadioGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 155
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 154
    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    .line 157
    :cond_1
    new-instance v2, Landroid/widget/RadioGroup$LayoutParams;

    const/4 v5, -0x1

    invoke-direct {v2, v5, v6}, Landroid/widget/RadioGroup$LayoutParams;-><init>(II)V

    goto :goto_2

    .line 159
    :cond_2
    invoke-virtual {v3, p2}, Landroid/widget/RadioGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v0

    invoke-virtual {v3, v0}, Landroid/widget/RadioGroup;->check(I)V

    return-object v3
.end method

.method private static key(I)Ljava/lang/String;
    .locals 2

    .prologue
    .line 38
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

.method private static label(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/TextView;
    .locals 2

    .prologue
    .line 151
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v1, 0x41700000    # 15.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    return-object v0
.end method

.method private static modeKey(I)Ljava/lang/String;
    .locals 2

    .prologue
    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "gif_mode_v1_"

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
    .line 37
    const-string v0, "sl_mod_settings"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method public static prompt(Landroid/app/Activity;I)V
    .locals 3

    .prologue
    .line 58
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "sl_gif_prompted"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 82
    :goto_0
    return-void

    .line 59
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "sl_gif_prompted"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 60
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
    .line 133
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    new-instance v1, LSLGifIcons$3;

    invoke-direct {v1, p0}, LSLGifIcons$3;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 134
    return-void
.end method

.method private static refreshView(Landroid/view/View;)V
    .locals 7

    .prologue
    const/4 v3, 0x0

    .line 138
    :try_start_0
    const-string v1, "ginlemon.flower.launchable.view.LaunchableView"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    .line 139
    invoke-virtual {v5, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 140
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    .line 141
    move-object v0, p0

    check-cast v0, Landroid/view/ViewGroup;

    move-object v1, v0

    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 142
    instance-of v4, v1, Landroid/widget/ImageView;

    if-eqz v4, :cond_3

    check-cast v1, Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    instance-of v1, v1, LSLGifIcons$GifDrawable;

    if-eqz v1, :cond_3

    const/4 v1, 0x1

    move v4, v1

    .line 143
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

    .line 148
    :cond_2
    return-void

    :cond_3
    move v4, v3

    .line 142
    goto :goto_0

    .line 146
    :catch_0
    move-exception v1

    .line 147
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

    .line 146
    :catch_1
    move-exception v1

    goto :goto_1
.end method

.method private static remove(Landroid/content/Context;I)Z
    .locals 2

    .prologue
    .line 43
    invoke-static {p0}, LSLGifIcons;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-static {p1}, LSLGifIcons;->key(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-static {p1}, LSLGifIcons;->sizeKey(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-static {p1}, LSLGifIcons;->shapeKey(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-static {p1}, LSLGifIcons;->modeKey(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v0

    return v0
.end method

.method public static result(Landroid/app/Activity;IIILandroid/content/Intent;)Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    .line 85
    const/16 v1, 0x7461

    if-eq p2, v1, :cond_1

    const/4 v0, 0x0

    .line 111
    :cond_0
    :goto_0
    return v0

    .line 86
    :cond_1
    const/4 v1, -0x1

    if-ne p3, v1, :cond_0

    if-eqz p4, :cond_0

    invoke-virtual {p4}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 87
    invoke-virtual {p4}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    .line 88
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, LSLGifIcons$2;

    invoke-direct {v3, p0, v1, p1}, LSLGifIcons$2;-><init>(Landroid/app/Activity;Landroid/net/Uri;I)V

    const-string v1, "GIF icon import"

    invoke-direct {v2, v3, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 110
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method private static shapeKey(I)Ljava/lang/String;
    .locals 2

    .prologue
    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "gif_shape_v1_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static sizeKey(I)Ljava/lang/String;
    .locals 2

    .prologue
    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "gif_size_v1_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static valid([B)Z
    .locals 6

    .prologue
    const/16 v5, 0x200

    const/4 v4, 0x4

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 114
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

    .line 116
    :cond_2
    :goto_0
    return v0

    .line 115
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

    .line 116
    if-lez v2, :cond_4

    if-lez v3, :cond_4

    if-gt v2, v5, :cond_4

    if-le v3, v5, :cond_2

    :cond_4
    move v0, v1

    goto :goto_0
.end method
