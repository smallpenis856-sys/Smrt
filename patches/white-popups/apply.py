from pathlib import Path
import sys
r=Path(sys.argv[1])
for name in ('sb0','rn'):
    p=r/f'smali_classes2/{name}.smali'
    s=p.read_text()
    old='''    const v0, 0x7f140139

    goto :goto_2'''
    assert s.count(old)==1
    s=s.replace(old,'''    const v0, 0x7f14013f

    goto :goto_2''')
    assert '.method public o()Z' not in s and '.method public p()Lgg;' not in s and '.method public q()Lgg4;' not in s
    s += f'''
# Scoped light palette and material for launcher action popovers, not folders or search.
.method public o()Z
    .locals 1
    const/4 v0, 0x0
    return v0
.end method

.method public p()Lgg;
    .locals 3
    invoke-virtual {{p0}}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v0
    const v1, 0x7f14013f
    const/4 v2, 0x1
    invoke-static {{v0, v1, v2}}, Lhgb;->y(Landroid/content/Context;IZ)Lgg;
    move-result-object v0
    return-object v0
.end method

.method public q()Lgg4;
    .locals 7
    new-instance v0, Lgg4;
    const/4 v1, 0x0
    const-wide v2, 0xffebebeb00000000L
    const/4 v4, 0x1
    const/4 v5, 0x1
    const/4 v6, 0x0
    invoke-direct/range {{v0 .. v6}}, Lgg4;-><init>(Lws0;JZZI)V
    return-object v0
.end method
'''
    # Relocate edited classes from the nearly-full second DEX to the existing fourth DEX.
    target=r/f'smali_classes4/{name}.smali'
    assert not target.exists()
    target.write_text(s)
    p.unlink()
p=r/'smali_classes2/vr5.smali'
s=p.read_text()
old='''    sget v12, Lb1b;->a:F

    move/from16 v16, v13'''
new='''    sget v12, Lb1b;->a:F

    # This exact solid material marks the light action popover: no arrow, rounded shape.
    if-nez v9, :sl_white_shape_done
    const-wide v18, 0xffebebeb00000000L
    cmp-long v20, v10, v18
    if-nez v20, :sl_white_shape_done
    invoke-static {v12}, Lwi9;->b(F)Lvi9;
    move-result-object v8
    :sl_white_shape_done

    move/from16 v16, v13'''
assert s.count(old)==1
s=s.replace(old,new)
old_padding = """    :cond_18
    invoke-static {v8, v9, v13, v14, v11}, Lzm2;->q(Lz67;FFFF)Lz67;"""
new_padding = """    :cond_18
    # With no arrow there is no need to reserve space for the arrow inside the card.
    move/from16 v16, v14
    iget-object v15, v3, Lgg4;->a:Lws0;
    if-nez v15, :sl_white_restore_padding
    iget-wide v14, v3, Lgg4;->b:J
    const-wide v18, 0xffebebeb00000000L
    cmp-long v20, v14, v18
    if-nez v20, :sl_white_restore_padding
    const/4 v9, 0x0
    const/4 v13, 0x0
    const/4 v14, 0x0
    const/4 v11, 0x0
    goto :sl_white_padding_done
    :sl_white_restore_padding
    move/from16 v14, v16
    :sl_white_padding_done
    invoke-static {v8, v9, v13, v14, v11}, Lzm2;->q(Lz67;FFFF)Lz67;"""
assert s.count(old_padding)==1
p.write_text(s.replace(old_padding,new_padding))
p=r/'apktool.yml';s=p.read_text();assert 'versionCode: 660300' in s;p.write_text(s.replace('versionCode: 660300','versionCode: 660301'))
