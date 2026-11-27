.class LSLGifIcons$9;
.super Ljava/lang/Object;
.source "SLGifIcons.java"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LSLGifIcons;->adjust(Landroid/app/Activity;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$dialog:Landroid/app/AlertDialog;

.field final synthetic val$fit:Landroid/widget/RadioGroup;

.field final synthetic val$id:I

.field final synthetic val$shape:Landroid/widget/RadioGroup;

.field final synthetic val$slider:Landroid/widget/SeekBar;

.field final synthetic val$style:LSLGifIcons$Style;


# direct methods
.method constructor <init>(Landroid/app/AlertDialog;Landroid/app/Activity;ILSLGifIcons$Style;Landroid/widget/SeekBar;Landroid/widget/RadioGroup;Landroid/widget/RadioGroup;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 193
    iput-object p1, p0, LSLGifIcons$9;->val$dialog:Landroid/app/AlertDialog;

    iput-object p2, p0, LSLGifIcons$9;->val$a:Landroid/app/Activity;

    iput p3, p0, LSLGifIcons$9;->val$id:I

    iput-object p4, p0, LSLGifIcons$9;->val$style:LSLGifIcons$Style;

    iput-object p5, p0, LSLGifIcons$9;->val$slider:Landroid/widget/SeekBar;

    iput-object p6, p0, LSLGifIcons$9;->val$fit:Landroid/widget/RadioGroup;

    iput-object p7, p0, LSLGifIcons$9;->val$shape:Landroid/widget/RadioGroup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onShow(Landroid/content/DialogInterface;)V
    .locals 2

    .prologue
    .line 194
    iget-object v0, p0, LSLGifIcons$9;->val$dialog:Landroid/app/AlertDialog;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    new-instance v1, LSLGifIcons$9$1;

    invoke-direct {v1, p0}, LSLGifIcons$9$1;-><init>(LSLGifIcons$9;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 198
    iget-object v0, p0, LSLGifIcons$9;->val$dialog:Landroid/app/AlertDialog;

    const/4 v1, -0x3

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    new-instance v1, LSLGifIcons$9$2;

    invoke-direct {v1, p0}, LSLGifIcons$9$2;-><init>(LSLGifIcons$9;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 201
    return-void
.end method
