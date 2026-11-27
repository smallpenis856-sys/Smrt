.class LSLGifIcons$1;
.super Ljava/lang/Object;
.source "SLGifIcons.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LSLGifIcons;->prompt(Landroid/app/Activity;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$id:I


# direct methods
.method constructor <init>(Landroid/app/Activity;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 35
    iput-object p1, p0, LSLGifIcons$1;->val$a:Landroid/app/Activity;

    iput p2, p0, LSLGifIcons$1;->val$id:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 36
    iget-object v0, p0, LSLGifIcons$1;->val$a:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 51
    :goto_0
    return-void

    .line 37
    :cond_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, LSLGifIcons$1;->val$a:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "Edit icon"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v0, 0x3

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v3, "Choose animated GIF"

    aput-object v3, v2, v0

    const/4 v3, 0x1

    .line 38
    iget-object v0, p0, LSLGifIcons$1;->val$a:Landroid/app/Activity;

    invoke-static {v0}, LSLGifIcons;->access$100(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    iget v4, p0, LSLGifIcons$1;->val$id:I

    invoke-static {v4}, LSLGifIcons;->access$000(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "Remove GIF and choose regular icon"

    :goto_1
    aput-object v0, v2, v3

    const/4 v0, 0x2

    const-string v3, "Remove animated GIF"

    aput-object v3, v2, v0

    new-instance v0, LSLGifIcons$1$3;

    invoke-direct {v0, p0}, LSLGifIcons$1$3;-><init>(LSLGifIcons$1;)V

    invoke-virtual {v1, v2, v0}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Cancel"

    new-instance v2, LSLGifIcons$1$2;

    invoke-direct {v2, p0}, LSLGifIcons$1$2;-><init>(LSLGifIcons$1;)V

    .line 50
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, LSLGifIcons$1$1;

    invoke-direct {v1, p0}, LSLGifIcons$1$1;-><init>(LSLGifIcons$1;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 38
    :cond_1
    const-string v0, "Choose regular icon"

    goto :goto_1
.end method
