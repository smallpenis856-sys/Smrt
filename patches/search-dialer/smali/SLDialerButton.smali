.class public final LSLDialerButton;
.super Ljava/lang/Object;
.source "SLDialerButton.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field private final button:Landroid/view/View;

.field private final clear:Landroid/view/View$OnClickListener;

.field private final editor:Landroid/widget/EditText;

.field private numeric:Z

.field private final originalType:I


# direct methods
.method public constructor <init>(Landroid/view/View;Landroid/widget/EditText;Landroid/view/View$OnClickListener;)V
    .registers 5

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, LSLDialerButton;->button:Landroid/view/View;

    iput-object p2, p0, LSLDialerButton;->editor:Landroid/widget/EditText;

    iput-object p3, p0, LSLDialerButton;->clear:Landroid/view/View$OnClickListener;

    .line 17
    invoke-virtual {p2}, Landroid/widget/EditText;->getInputType()I

    move-result v0

    iput v0, p0, LSLDialerButton;->originalType:I

    .line 18
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 19
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 20
    invoke-direct {p0}, LSLDialerButton;->updateLabel()V

    .line 21
    return-void
.end method

.method private updateLabel()V
    .registers 3

    .prologue
    .line 47
    iget-object v1, p0, LSLDialerButton;->button:Landroid/view/View;

    iget-boolean v0, p0, LSLDialerButton;->numeric:Z

    if-eqz v0, :cond_c

    const-string v0, "Text keyboard; touch and hold to clear search"

    :goto_8
    invoke-virtual {v1, v0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 48
    return-void

    .line 47
    :cond_c
    const-string v0, "Number keyboard; touch and hold to clear search"

    goto :goto_8
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 6

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 23
    iget-boolean v0, p0, LSLDialerButton;->numeric:Z

    if-nez v0, :cond_55

    move v0, v1

    :goto_7
    iput-boolean v0, p0, LSLDialerButton;->numeric:Z

    .line 24
    iget-object v3, p0, LSLDialerButton;->editor:Landroid/widget/EditText;

    iget-boolean v0, p0, LSLDialerButton;->numeric:Z

    if-eqz v0, :cond_57

    const/4 v0, 0x3

    :goto_10
    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setRawInputType(I)V

    .line 25
    iget-boolean v0, p0, LSLDialerButton;->numeric:Z

    if-eqz v0, :cond_32

    .line 26
    iget-object v0, p0, LSLDialerButton;->editor:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    .line 27
    :goto_1d
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-ge v2, v3, :cond_32

    .line 28
    invoke-interface {v0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isLetter(C)Z

    move-result v3

    if-eqz v3, :cond_5a

    iget-object v0, p0, LSLDialerButton;->editor:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->selectAll()V

    .line 31
    :cond_32
    iget-object v0, p0, LSLDialerButton;->editor:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    .line 32
    invoke-direct {p0}, LSLDialerButton;->updateLabel()V

    .line 33
    iget-object v0, p0, LSLDialerButton;->editor:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "input_method"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 34
    if-eqz v0, :cond_54

    .line 35
    iget-object v2, p0, LSLDialerButton;->editor:Landroid/widget/EditText;

    invoke-virtual {v0, v2}, Landroid/view/inputmethod/InputMethodManager;->restartInput(Landroid/view/View;)V

    .line 36
    iget-object v2, p0, LSLDialerButton;->editor:Landroid/widget/EditText;

    invoke-virtual {v0, v2, v1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 38
    :cond_54
    return-void

    :cond_55
    move v0, v2

    .line 23
    goto :goto_7

    .line 24
    :cond_57
    iget v0, p0, LSLDialerButton;->originalType:I

    goto :goto_10

    .line 27
    :cond_5a
    add-int/lit8 v2, v2, 0x1

    goto :goto_1d
.end method

.method public onLongClick(Landroid/view/View;)Z
    .registers 3

    .prologue
    .line 40
    iget-object v0, p0, LSLDialerButton;->clear:Landroid/view/View$OnClickListener;

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 41
    const/4 v0, 0x1

    return v0
.end method

.method public reset()V
    .registers 3

    .prologue
    .line 44
    iget-boolean v0, p0, LSLDialerButton;->numeric:Z

    if-eqz v0, :cond_11

    const/4 v0, 0x0

    iput-boolean v0, p0, LSLDialerButton;->numeric:Z

    iget-object v0, p0, LSLDialerButton;->editor:Landroid/widget/EditText;

    iget v1, p0, LSLDialerButton;->originalType:I

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setRawInputType(I)V

    invoke-direct {p0}, LSLDialerButton;->updateLabel()V

    .line 45
    :cond_11
    return-void
.end method
